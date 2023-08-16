import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:message_app/common/utils/colors.dart';
import 'package:message_app/common/widgets/error.dart';
import 'package:message_app/features/auth/controller/auth_controller.dart';
import 'package:message_app/features/landing/screens/landing_screen.dart';
import 'package:message_app/firebase_options.dart';
import 'package:message_app/route.dart';
import 'package:message_app/screen/mobile_layout_screen.dart';

import 'common/widgets/loading_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      home: ref.watch(userDataAuthProvider).when(
        data: (user){
          if(user == null){
            return const LandingScreen();
          }
          return const MobileLayoutScreen();
        }, 
        error: (error, trace){
          return ErrorScreen(error: error.toString());
        } ,
        loading: () => const LoadingScreen())
    );
  }
}

