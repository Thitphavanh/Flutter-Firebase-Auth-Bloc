import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_auth_bloc/pages/home_page.dart';
import 'package:flutter_firebase_auth_bloc/pages/signin_page.dart';
import 'package:flutter_firebase_auth_bloc/pages/signup_page.dart';
import 'package:flutter_firebase_auth_bloc/pages/splash_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PHENOMENAL INC.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: {
        SignupPage.routeName: (context) => SignupPage(),
        SigninPage.routeName: (context) => SigninPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
