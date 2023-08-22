import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:message_app/common/widgets/error.dart';
import 'package:message_app/common/widgets/loading_screen.dart';
import 'package:message_app/features/select_contact/controller/select_contact_controller.dart';


class SelectContactScreen extends ConsumerWidget {
  static const String routeName = '/select_contacts';
  const SelectContactScreen({super.key}); 

  void selectContact(WidgetRef ref, Contact selectedContact, BuildContext context){
    ref.read(selectContactControllerProvider).selectContact(selectedContact, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contacts'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ],
      ),

      body: ref.watch(getContactsProvider).when(
        data: (contactList) => ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            final contact = contactList[index];
            return InkWell(
              onTap: () => selectContact(ref, contact, context),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  title: Text(contact.displayName, style: const TextStyle(fontSize: 18),),
                  leading: contact.photo == null? null: CircleAvatar(
                    backgroundImage: MemoryImage(contact.photo!),
                    radius: 30,
                  ),
                ), 
              ),
            );
          },
        ), 
        error: (error, trace) => ErrorScreen(error: error.toString()), 
        loading: ()=> const LoadingScreen(),
      ),
    );
  }
}