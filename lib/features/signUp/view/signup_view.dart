import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/signup/view/widget/signup_elevated_button_widget.dart';
import 'package:flutter_recipe_shot/features/signup/view/widget/signup_text_form_field_widget.dart';
import 'package:flutter_recipe_shot/features/signup/view_model/signup_view_model.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:flutter_recipe_shot/res/widgets/sized_box_widget.dart';
import 'package:flutter_recipe_shot/res/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupView extends StatefulWidget {
  static const String id = 'signup_view';
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupViewModel vm = SignupViewModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Consumer<SignupViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: AppColors.BASE_BLACK,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.whiteColor,
              elevation: 0.0,
            ),
            body: ChangeNotifierProvider<SignupViewModel>(
              create: (context) => vm,
              child: Consumer<SignupViewModel>(
                builder: (context, vm, child) {
                  return Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)!
                                  .sign_up_create_account,
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)!.sign_up_already_have_an_account,
                              style: TextStyle(
                                color: AppColors.BASE_WHITE,
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                              ),),
                          ),
                          Container(
                            child: Column(
                              children: [],
                            ),
                          ),
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
                            trailingIcon: _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
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
        },
      ),
    );
  }
}
