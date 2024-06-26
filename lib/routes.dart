import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/ui/auth/sign_in_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String create_edit_todo = '/create_edit_todo';

  static final routes = <String, WidgetBuilder>{
    //splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => const SignInScreen(),
    // register: (BuildContext context) => RegisterScreen(),
    // home: (BuildContext context) => TodosScreen(),
    // setting: (BuildContext context) => SettingScreen(),
    // create_edit_todo: (BuildContext context) => CreateEditTodoScreen(),
  };
}
