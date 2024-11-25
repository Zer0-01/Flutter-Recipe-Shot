import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/features/signup/view/widget/signup_elevated_button_widget.dart';
import 'package:flutter_recipe_shot/features/signup/view_model/signup_view_model.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:flutter_recipe_shot/res/widgets/sized_box_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final String icHuman = 'lib/assets/ic_human.svg';
  final String icMail = 'lib/assets/ic_mail.svg';
  final String icCalendar = 'lib/assets/ic_calendar.svg';
  final String icLock = 'lib/assets/ic_lock.svg';

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
                  return SingleChildScrollView(
                    child: Form(
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
                            const SizedBox(
                              height: 12,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)!
                                    .sign_up_already_have_an_account,
                                style: const TextStyle(
                                    color: AppColors.BASE_WHITE,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.BASE_WHITE,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(icHuman,
                                            height: 16,
                                            width: 16,
                                            colorFilter: ColorFilter.mode(
                                                AppColors.PURPLE_75,
                                                BlendMode.srcIn)),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        const Expanded(
                                            child: TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                        )),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(icMail,
                                            colorFilter: ColorFilter.mode(
                                                AppColors.PURPLE_75,
                                                BlendMode.srcIn)),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                            child: TextField(
                                          controller: vm.emailController,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        )),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(icCalendar,
                                            colorFilter: ColorFilter.mode(
                                                AppColors.PURPLE_75,
                                                BlendMode.srcIn)),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        const Expanded(
                                            child: TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                        )),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(icLock,
                                            colorFilter: ColorFilter.mode(
                                                AppColors.PURPLE_75,
                                                BlendMode.srcIn)),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                            child: TextField(
                                          controller: vm.passwordController,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBoxWidget.h32,
                            SignUpButtonWidget(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                  vm.isSuccess = await vm.signUp();
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();

                                  if (vm.isSuccess) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          AppLocalizations.of(context)!
                                              .sign_up_success),
                                      backgroundColor: Colors.green,
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          AppLocalizations.of(context)!
                                              .sign_up_failed),
                                      backgroundColor: Colors.red,
                                    ));
                                  }
                                }
                              },
                            )
                          ],
                        ),
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
