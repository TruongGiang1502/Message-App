import 'package:flutter/material.dart';
import 'package:message_app/common/utils/colors.dart';
import 'package:message_app/common/widgets/custom_button.dart';
import 'package:message_app/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context){
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            const Text(
              'Welcome to Message App',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height/10),
            Image.asset(
              'assets/bg.png',
              color: tabColor,
              height: 340,
              width: 340,
            ),
            SizedBox(height: size.height/13),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Read our Privacy Policy. Tab "Agree and Continue" to accept the Terms of service',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: greycolor
                )
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: size.width*0.75,
              child: CustomButton(
                onPressed: () => navigateToLoginScreen(context), 
                text: 'Agree and Continue'
              )
            ),
          ],
        ),
      ),
    );
  }
}