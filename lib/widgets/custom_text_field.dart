import 'package:contact/utils/colors_asset.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller ;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final String hintText;

  const CustomTextField({required this.controller,
    required this.keyboardType,
    required this.textInputAction,
  this.validator,
  required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.gold,
      cursorRadius: Radius.circular(16),
      keyboardType:keyboardType ,
      controller: controller,
      textInputAction: textInputAction,
     validator: validator,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.gold,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        hintText:  hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: AppColors.hint,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold,width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold,width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold,width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red,width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.gold,width: 1),
        ),
      ),
    );

  }
}
