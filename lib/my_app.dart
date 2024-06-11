import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/auth_widget_builder.dart';
import 'package:flutter_recipe_shot/models/UserModel.dart';
import 'package:flutter_recipe_shot/providers/auth_provider.dart';
import 'package:flutter_recipe_shot/routes.dart';
import 'package:flutter_recipe_shot/services/firestore_database.dart';
import 'package:flutter_recipe_shot/ui/auth/sign_in_screen.dart';
import 'package:flutter_recipe_shot/ui/home/home.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final FirestoreDatabase Function(BuildContext context, String uid)
      databaseBuilder;
  const MyApp({super.key, required this.databaseBuilder});

  @override
  Widget build(BuildContext context) {
    return AuthWidgetBuilder(
      databaseBuilder: databaseBuilder,
      builder: (BuildContext context, AsyncSnapshot<UserModel> userSnapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: Routes.routes,
          home: Consumer<AuthProvider>(
            builder: (_, authProviderRef, __) {
              if (userSnapshot.connectionState == ConnectionState.active) {
                return userSnapshot.hasData
                    ? const HomeScreen()
                    : const SignInScreen();
              }
              return const Material(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      },
      key: const Key('AuthWidget'),
    );
  }
}
