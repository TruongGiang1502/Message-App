import 'package:flutter/material.dart';
import 'package:message_app/screen/mobile_layout_screen.dart';
import 'package:message_app/screen/web_layout_screen.dart';
import 'package:message_app/utils/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: //MobileChatScreen()
      const ResponsiveLayout(
        mobileScreenLayout: MobileLayoutScreen(), 
        webScreenLayout: WebLayoutScreen()
      )
    );
  }
}

