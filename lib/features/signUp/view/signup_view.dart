import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/signUp/view/widget/sign_up_button_widget.dart';
import 'package:flutter_recipe_shot/features/signUp/view/widget/text_form_field_widget.dart';
import 'package:flutter_recipe_shot/features/signUp/vm/signup_vm.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:flutter_recipe_shot/res/widgets/sized_box_widget.dart';
import 'package:flutter_recipe_shot/res/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupVm vm = SignupVm();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormFieldWidget(
                      labelText: 'Name',
                      validator: (value) =>
                          value!.isEmpty ? 'Enter a name' : null,
                      inputController: vm.nameController,
                    ),
                    SizedBoxWidget.h32,
                    TextFormFieldWidget(
                      labelText: 'Email',
                      validator: (value) =>
                          value!.isEmpty ? 'Enter an email' : null,
                      inputController: vm.emailController,
                    ),
                    SizedBoxWidget.h32,
                    TextFormFieldWidget(
                      labelText: 'Password',
                      validator: (value) => value!.length < 6
                          ? "Enter a password 6+ characters long"
                          : null,
                      inputController: vm.passwordController,
                    ),
                    SizedBoxWidget.h32,
                    SignUpButtonWidget(
                      data: 'Sign Up',
                      buttonBackgroundColor: AppColors.primaryColor,
                      buttonForegroundColor: Colors.white,
                      onPressed: vm.isLoading
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                await vm.signUpUserWithEmailAndPassword();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Success')));
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
