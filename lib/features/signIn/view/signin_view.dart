import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/signin/view/widget/sign_in_button_widget.dart';
import 'package:flutter_recipe_shot/features/signin/view/widget/sign_up_navigator_widget.dart';
import 'package:flutter_recipe_shot/features/signin/view/widget/text_form_field_widget.dart';
import 'package:flutter_recipe_shot/features/signin/vm/signin_vm.dart';
import 'package:flutter_recipe_shot/features/signup/view/signup_view.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class SigninView extends StatefulWidget {
  static const String id = 'signin_view';
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final SigninVm vm = SigninVm();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('lib/assets/logo-recipe.png'),
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormFieldWidget(
                inputController: vm.emailController,
                labelText: 'Email',
                validator: (value) => value!.isEmpty ? 'Enter an email' : null,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormFieldWidget(
                inputController: vm.passwordController,
                labelText: 'Password',
                validator: (value) => value!.length < 6
                    ? "Enter a password 6+ characters long"
                    : null,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: SignInButtonWidget(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          vm.signIn(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
              SignUpNavigatorWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupView(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
