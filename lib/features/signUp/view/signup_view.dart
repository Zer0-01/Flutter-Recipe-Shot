import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/signup/view/widget/signup_elevated_button_widget.dart';
import 'package:flutter_recipe_shot/features/signup/view/widget/signup_text_form_field_widget.dart';
import 'package:flutter_recipe_shot/features/signup/vm/signup_vm.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:flutter_recipe_shot/res/widgets/sized_box_widget.dart';
import 'package:flutter_recipe_shot/res/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  static const String id = 'signup_view';
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupVm vm = SignupVm();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreenColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.whiteColor,
        elevation: 0.0,
        title: const TextWidget(
          data: 'Sign Up',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ChangeNotifierProvider<SignupVm>(
        create: (context) => vm,
        child: Consumer<SignupVm>(
          builder: (context, vm, child) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SignupTextFormFieldWidget(
                      hintText: 'Name',
                      validator: (value) =>
                          value!.isEmpty ? 'Enter a name' : null,
                      controller: vm.nameController,
                      obscureText: false,
                      leadingIcon: Icons.person,
                    ),
                    SizedBoxWidget.h32,
                    SignupTextFormFieldWidget(
                      hintText: 'Email',
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an email' : null,
                      controller: vm.emailController,
                      leadingIcon: Icons.email,
                      obscureText: false,
                    ),
                    SizedBoxWidget.h32,
                    SignupTextFormFieldWidget(
                      hintText: 'Password',
                      validator: (value) => value!.length < 6
                          ? "Enter a password 6+ characters long"
                          : null,
                      controller: vm.passwordController,
                      leadingIcon: Icons.lock,
                      trailingIcon:
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                      obscureText: _isObscure,
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    SizedBoxWidget.h32,
                    SignUpButtonWidget(
                      onPressed: vm.isLoading
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                vm.signUp(context);
                              }
                            },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
