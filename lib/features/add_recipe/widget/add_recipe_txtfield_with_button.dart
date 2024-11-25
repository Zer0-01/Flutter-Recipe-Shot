import 'package:flutter/material.dart';
import 'package:flutter_recipe_shot/res/colors/app_colors.dart';

class AddRecipeTxtfieldWithButton extends StatelessWidget {
  final String labelText;
  final Color? labelColor;
  final FontWeight? fontWeight;
  final Color? cursorColor;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? inputColor;
  final Color? fillColor;
  final void Function()? onPressed;
  const AddRecipeTxtfieldWithButton({
    super.key,
    required this.labelText,
    this.labelColor = AppColors.PURPLE_100,
    this.fontWeight = FontWeight.bold,
    this.cursorColor = AppColors.PURPLE_100,
    this.validator,
    this.controller,
    this.inputColor = AppColors.PURPLE_100,
    this.fillColor = AppColors.BASE_WHITE,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(color: labelColor, fontWeight: fontWeight),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextFormField(
                  cursorColor: cursorColor,
                  validator: validator,
                  controller: controller,
                  style:
                      TextStyle(color: inputColor, fontWeight: FontWeight.bold),
                  maxLines: null,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: fillColor,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.PURPLE_50,
                  foregroundColor: AppColors.BASE_WHITE,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: onPressed,
                child: const Icon(Icons.add),
              ),
            ),
          ],
        )
      ],
    );
  }
}
