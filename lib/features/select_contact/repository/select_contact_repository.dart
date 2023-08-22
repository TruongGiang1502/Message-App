import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:message_app/common/utils/utils.dart';
import 'package:message_app/model/user_model.dart';
import 'package:message_app/screen/mobile_chat_screen.dart';

final selectContactsRepositoryProvider = Provider(
    (ref) => SelectContactRepository(firestore: FirebaseFirestore.instance));

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({required this.firestore});

  Future <List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if(await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    }
    catch (e){
      debugPrint(e.toString());
    }

    return contacts;
  }

  void selectContact (Contact selectedContact, BuildContext context)async{
    try{
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;

      for (var document in userCollection.docs){
        var userData = UserModel.fromMap(document.data());
        String selectedPhoneNumber = selectedContact.phones[0].number.replaceAll(' ', '');
        if(selectedPhoneNumber == userData.phoneNumber){
          isFound = true;
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(
            context, 
            MobileChatScreen.routeName,
            arguments: {
              'name': userData.name,
              'uid': userData.uid,
            }
          );
        }
      }
      if(!isFound){
        // ignore: use_build_context_synchronously
        showSnackBar(context: context, content: 'This number does not exist on this app');
      }
      
    } 
    catch (error){
      // ignore: use_build_context_synchronously
      showSnackBar(context: context, content: error.toString());
    }
  }
}
