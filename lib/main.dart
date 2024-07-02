import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/home/view/home_view.dart';
import 'package:flutter_recipe_shot/features/signIn/view/signin_view.dart';
import 'package:flutter_recipe_shot/features/signUp/view/signup_view.dart';
import 'package:flutter_recipe_shot/features/splash/view/splash_view.dart';
import 'package:flutter_recipe_shot/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashView(),
        '/signin': (context) => const SigninView(),
        '/signup': (context) => const SignupView(),
        '/home': (context) => const HomeView(),
      },
      title: 'Recipe Shot',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
