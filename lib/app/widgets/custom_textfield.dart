import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator; // Updated validator type
  final bool? enabled;
  final AutovalidateMode? autoValidateMode;

  final bool? obscureText;
  final int? maxLength;

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.icon,
      required this.textEditingController,
      this.validator,
      this.enabled,
      this.obscureText,
      this.suffixIcon,
        this.autoValidateMode,
        this.maxLength});

  // bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? false,
      controller: textEditingController,
      obscureText: obscureText ?? false,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterText: "",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
          hintText: hint,
          hintStyle: AppTextStyles.smallStyle.copyWith(color: AppColors.grey),
          prefixIcon: icon,
          prefixIconColor: AppColors.grey,
          suffixIcon: suffixIcon),
      validator: validator,
    );
  }
}
