import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final String title;
  final Icon? icon;

  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  int? maxLines;
  InputField({super.key,required this.title, required this.textEditingController,this.maxLines,this.validator,this.onChanged, this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.smallStyle.copyWith(color: AppColors.grey.shade600,fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(

          controller: textEditingController,
          maxLines: maxLines,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: icon,
            hintStyle: const TextStyle(color: AppColors.appGrey),
            hintText: hintText,
            contentPadding: const EdgeInsets.all(8.0),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          // obscureText: isObsecure,
        ),
      ],
    );
  }
}
