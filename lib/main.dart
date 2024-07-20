import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/add_recipe/view/add_recipe_view.dart';
import 'package:flutter_recipe_shot/features/home/view/home_view.dart';
import 'package:flutter_recipe_shot/features/recipes/view/recipes_view.dart';
import 'package:flutter_recipe_shot/features/signIn/view/signin_view.dart';
import 'package:flutter_recipe_shot/features/signup/view/signup_view.dart';
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
      initialRoute: SplashView.id,
      routes: {
        SplashView.id: (context) => const SplashView(),
        SigninView.id: (context) => const SigninView(),
        SignupView.id: (context) => const SignupView(),
        HomeView.id: (context) => const HomeView(),
        RecipesView.id: (context) => const RecipesView(),
        AddRecipeView.id: (context) => const AddRecipeView(),
      },
      title: 'Recipe Shot',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
