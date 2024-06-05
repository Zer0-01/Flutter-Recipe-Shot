import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/constants/constants.dart';
import 'package:flutter_recipe_shot/features/signIn/view/widget/text_form_field_widget.dart';
import 'package:flutter_recipe_shot/features/signIn/viewModel/sign_in_view_model.dart';
import 'package:flutter_recipe_shot/services/auth_service.dart';

class SignInView extends StatefulWidget {
  final Function toggleView;
  const SignInView({super.key, required this.toggleView});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
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
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          'Sign In to Recipe Shot',
          style: TextStyle(color: text),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            label: Text('Sign Up'),
            icon: Icon(Icons.person),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormFieldWidget(
              inputController: vm.emailController,
              icon: Icon(Icons.person),
              labelText: 'Email',
              validator: (value) => value!.isEmpty ? 'Enter an email' : null,
            ),
            TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter an email' : null,
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            TextFormField(
              validator: (value) => value!.length < 6
                  ? "Enter a password 6+ characters long"
                  : null,
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  dynamic result = await _authService.signIn(email, password);
                  if (result == null) {
                    setState(() {
                      error = 'Could not sign in with the credentials';
                    });
                  }
                }
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
