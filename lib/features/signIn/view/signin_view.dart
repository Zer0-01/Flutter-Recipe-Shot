import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/signin/view/widget/sign_up_navigator_widget.dart';
import 'package:flutter_recipe_shot/features/signin/view/widget/signin_button_widget.dart';
import 'package:flutter_recipe_shot/features/signin/view/widget/signin_text_form_field_widget.dart';
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
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
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
              SigninTextFormFieldWidget(
                controller: vm.emailController,
                obscureText: false,
                hintText: 'Email',
                leadingIcon: Icons.email,
                validator: (value) => value!.isEmpty ? 'Enter an email' : null,
              ),
              const SizedBox(
                height: 32,
              ),
              SigninTextFormFieldWidget(
                controller: vm.passwordController,
                obscureText: _isObscure,
                leadingIcon: Icons.key,
                trailingIcon:
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                hintText: 'Password',
                validator: (value) => value!.length < 6
                    ? "Enter a password 6+ characters long"
                    : null,
              ),
              const SizedBox(
                height: 32,
              ),
              SignInButtonWidget(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    vm.signIn(context);
                  }
                },
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
