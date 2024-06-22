import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/splash/view/splash_view.dart';
import 'package:flutter_recipe_shot/firebase_options.dart';
import 'package:flutter_recipe_shot/my_app.dart';
import 'package:flutter_recipe_shot/providers/auth_provider.dart';
import 'package:flutter_recipe_shot/services/firestore_database.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider<AuthProvider>(
      //       create: (context) => AuthProvider(),
      //     ),
      //   ],
      //   child: MyApp(
      //     databaseBuilder: (_, uid) => FirestoreDatabase(uid: uid),
      //     key: const Key('MyApp'),
      //   ),
      // ),
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Shot',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashView(),
    );
  }
}
