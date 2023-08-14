import 'package:flutter/material.dart';

class UserInformationScreen extends StatefulWidget {
  static const routeName = '/user_information_screen';
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information Screen'),
      ),
    );
  }
}