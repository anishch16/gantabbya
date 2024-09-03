import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
class TransparentButton extends StatelessWidget {
  final String title;
  const TransparentButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.primary),
      ),
      child: Center(
        child: Text(
          title,
          style: normalStyle.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.primary),
        ),
      ),
    );
  }
}
