import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  const SignUpButtonWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.PURPLE_75,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
        ),
        child: Text(AppLocalizations.of(context)!.sign_up_sign_up),
      ),
    );
  }
}
