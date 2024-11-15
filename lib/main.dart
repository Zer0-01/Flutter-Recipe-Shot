import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/data/local/shared_preferences_helper.dart';
import 'package:flutter_recipe_shot/features/add_recipe/view/add_recipe_view.dart';
import 'package:flutter_recipe_shot/features/main/view/main_view.dart';
import 'package:flutter_recipe_shot/features/recipe_details/view/recipe_details_view.dart';
import 'package:flutter_recipe_shot/features/signIn/view/signin_view.dart';
import 'package:flutter_recipe_shot/features/signup/view/signup_view.dart';
import 'package:flutter_recipe_shot/features/splash/view/splash_view.dart';
import 'package:flutter_recipe_shot/firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesHelper.instance.init();

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
        MainView.id: (context) => const MainView(),
        SigninView.id: (context) => const SigninView(),
        SignupView.id: (context) => const SignupView(),
        AddRecipeView.id: (context) => const AddRecipeView(),
        RecipeDetailsView.id: (context) => RecipeDetailsView(
              recipeId: ModalRoute.of(context)!.settings.arguments as String,
            ),
      },
      title: 'Recipe Shot',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
