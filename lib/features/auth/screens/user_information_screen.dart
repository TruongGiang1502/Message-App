import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:message_app/common/utils/colors.dart';
import 'package:message_app/common/utils/utils.dart';
import 'package:message_app/features/auth/controller/auth_controller.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const routeName = '/user_information_screen';
  const UserInformationScreen({super.key});

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void storeUserData() async {
    String name = nameController.text.trim();

    if(name.isNotEmpty){
      ref.read(authControllerProvider).saveUserDataToFirebase(context, name, image);
    }
    else {
      showSnackBar(context: context, content: "Please enter your name");
    }

  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text('User Information'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  image == null ?const CircleAvatar(
                    radius: 56,
                    backgroundImage: NetworkImage(
                      'https://t4.ftcdn.net/jpg/03/59/58/91/360_F_359589186_JDLl8dIWoBNf1iqEkHxhUeeOulx0wOC5.jpg',
                    ),
                  ): CircleAvatar(
                    radius: 56,
                    backgroundImage: FileImage(
                      image!
                    ),
                  ),

                  Positioned(
                    bottom: -10,
                    right: 0,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    
                    width: size.width * 0.75,
                    height: size.height*0.05,
                    child: TextField(
                      showCursor: true,
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greycolor
                          )
                        ),
                        //border: InputBorder.none
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: storeUserData,
                    color: Colors.green, 
                    icon: const Icon(
                      Icons.done,
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
