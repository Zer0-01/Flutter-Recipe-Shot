import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/signin/view/widget/sign_up_navigator_widget.dart';
import 'package:flutter_recipe_shot/features/signin/view/widget/signin_button_widget.dart';
import 'package:flutter_recipe_shot/features/signin/view/widget/signin_text_form_field_widget.dart';
import 'package:flutter_recipe_shot/features/signin/view_model/signin_view_model.dart';
import 'package:flutter_recipe_shot/features/signup/view/signup_view.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SigninView extends StatefulWidget {
  static const String id = 'signin_view';
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final SigninViewModel vm = SigninViewModel();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  final String icFacebook = 'lib/assets/ic_facebook.svg';
  final String icGoogle = 'lib/assets/ic_google.svg';
  final String icApple = 'lib/assets/ic_apple.svg';
  final String icLogo = 'lib/assets/logo-recipe.png';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Consumer<SigninViewModel>(builder: (context, vm, child) {
        return Scaffold(
          backgroundColor: AppColors.darkGreenColor,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(icLogo),
                          height: 160,
                          width: 146,
                        ),
                        Text(
                          AppLocalizations.of(context)!.welcome_back,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.normal,
                              color: AppColors.whiteColor),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SigninTextFormFieldWidget(
                          controller: vm.emailController,
                          obscureText: false,
                          hintText: 'Email',
                          leadingIcon: Icons.email,
                          validator: (value) =>
                              value!.isEmpty ? 'Enter an email' : null,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SigninTextFormFieldWidget(
                          controller: vm.passwordController,
                          obscureText: _isObscure,
                          leadingIcon: Icons.key,
                          trailingIcon: _isObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          hintText: "Password",
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
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 1,
                                color: AppColors.WHITE,
                                width: 200,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  AppLocalizations.of(context)!.or,
                                  style: const TextStyle(
                                      fontSize: 12, color: AppColors.WHITE),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 1,
                                color: AppColors.WHITE,
                                width: 200,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.WHITE),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(icFacebook),
                              ),
                            ),
                            const SizedBox(
                              width: 26,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.WHITE),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(icGoogle),
                              ),
                            ),
                            const SizedBox(
                              width: 26,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.WHITE),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(icApple),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
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
              ),
            ),
          ),
        );
      }),
    );
  }
}
