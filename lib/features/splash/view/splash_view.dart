import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/splash/vm/splash_vm.dart';

class SplashView extends StatefulWidget {
  static const String id = 'splash_view';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashVm vm = SplashVm();

  @override
  void initState() {
    super.initState();
    vm.checkSignInStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
