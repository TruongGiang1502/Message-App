import 'package:flutter/material.dart';
import 'package:message_app/common/widgets/error.dart';
import 'package:message_app/features/auth/screens/login_screen.dart';
import 'package:message_app/features/auth/screens/otp_screen.dart';
import 'package:message_app/features/auth/screens/user_information_screen.dart';

Route <dynamic> generateRoute (RouteSettings settings){
  switch(settings.name){
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case OTPScreen.routeName:
      final vertificationID = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => OTPScreen(
        verificationId: vertificationID
      ));
    case UserInformationScreen.routeName:
      return MaterialPageRoute(builder: (context) => const UserInformationScreen());
    default: 
      return MaterialPageRoute(builder: (context) => const Scaffold(
        body: ErrorScreen(error: 'This page doesn\'t exists'),
      ),);
  }
}