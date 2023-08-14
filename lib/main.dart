import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:message_app/common/utils/colors.dart';
import 'package:message_app/features/landing/screens/landing_screen.dart';
import 'package:message_app/firebase_options.dart';
import 'package:message_app/route.dart';
// import 'package:message_app/screen/mobile_layout_screen.dart';
// import 'package:message_app/screen/web_layout_screen.dart';
// import 'package:message_app/utils/responsive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          color: appBarColor
        )
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LandingScreen()
      // const ResponsiveLayout(
      //   mobileScreenLayout: MobileLayoutScreen(), 
      //   webScreenLayout: WebLayoutScreen()
      // )
    );
  }
}

