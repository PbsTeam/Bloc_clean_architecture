import 'package:flutter/material.dart';
import '../colors/app_color.dart';


class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final Icon? prefixIcon;
  const AppTextFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.hintText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        prefixIcon: prefixIcon,
        enabledBorder: textFormFieldBorderDecoration(),
        errorBorder: textFormFieldBorderDecoration(),
        focusedBorder: textFormFieldBorderDecoration(),
        disabledBorder: textFormFieldBorderDecoration(),
        focusedErrorBorder: textFormFieldBorderDecoration(),
      ),
    );
  }

  OutlineInputBorder textFormFieldBorderDecoration() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColor.blue),
  );
}
