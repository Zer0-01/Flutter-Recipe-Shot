import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/constants/constants.dart';
import 'package:flutter_recipe_shot/features/signIn/view/widget/sign_in_button_widget.dart';
import 'package:flutter_recipe_shot/features/signIn/view/widget/sign_up_navigator_widget.dart';
import 'package:flutter_recipe_shot/features/signIn/view/widget/text_form_field_widget.dart';
import 'package:flutter_recipe_shot/features/signIn/viewModel/sign_in_view_model.dart';
import 'package:flutter_recipe_shot/features/signUp/view/signup_view.dart';
import 'package:flutter_recipe_shot/services/auth_service.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final SignInViewModel vm = SignInViewModel();
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      // appBar: AppBar(
      //   backgroundColor: primary,
      //   title: Text(
      //     'Sign In to Recipe Shot',
      //     style: TextStyle(color: text),
      //   ),
      //   actions: [
      //     TextButton.icon(
      //       onPressed: () {
      //         widget.toggleView();
      //       },
      //       label: Text('Sign Up'),
      //       icon: Icon(Icons.person),
      //     )
      //   ],
      // ),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result =
                              await _authService.signIn(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Could not sign in with the credentials';
                            });
                          }
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
                        builder: (context) => SignupView(),
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
