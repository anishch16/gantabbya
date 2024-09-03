import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final Icon icon;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator; // Updated validator type
  final bool isPassword;
  final bool? enabled;

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.icon,
      required this.textEditingController,
      this.validator,
      this.isPassword = false, this.enabled});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled ?? false,
      controller: widget.textEditingController,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(12.0),
        ),
        hintText: widget.hint,
        hintStyle: smallStyle.copyWith(color: AppColors.grey),
        prefixIcon: widget.icon,
        prefixIconColor: AppColors.grey,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.grey,
                ),
              )
            : null,
      ),
      validator: widget.validator,
    );
  }
}
