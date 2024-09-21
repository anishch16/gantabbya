import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
class SearchField extends StatelessWidget {
  final String text;
  const SearchField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(12.0),
          ) ,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.transparent),
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: const EdgeInsets.all(2.0),
          hintText: text,
          filled: true,
          fillColor: AppColors.grey.shade200,
          hintStyle: AppTextStyles.smallStyle.copyWith(color: AppColors.grey),
          // prefixIcon: prefixIcon: icon,
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: AppColors.grey,

        ),
      ),
    );  }
}
