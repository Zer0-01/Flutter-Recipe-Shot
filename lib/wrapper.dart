import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/models/user_model.dart';
import 'package:flutter_recipe_shot/screens/authenticate/authenticate.dart';
import 'package:flutter_recipe_shot/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel?>(context);

    if (userModel == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
