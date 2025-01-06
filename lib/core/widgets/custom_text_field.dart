import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType? textInputType;
  final int maxLines;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isObscured;
  final void Function(String)? onChanged;
  final bool needsValidation;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.textInputType,
    this.suffixIcon,
    this.onChanged,
    this.controller,
    this.isObscured,
    this.maxLines = 1,
    this.contentPadding,
    this.needsValidation=true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscured ?? false,
      onChanged: onChanged,
      validator:needsValidation? (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      }: null,
      keyboardType: textInputType ?? TextInputType.emailAddress,
      decoration: InputDecoration(
        hintMaxLines: maxLines,
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        suffixIconColor: const Color(0xff949D9E),
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(color: const Color(0xff949D9E)),
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          4.0,
        ),
        borderSide: const BorderSide(color: Color(0xffE6E9E9)));
  }
}
