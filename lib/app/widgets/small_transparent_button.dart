import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
class SmallTransparentButton extends StatelessWidget {
  final String title;
  const SmallTransparentButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.transparent,
        border: Border.all(color: AppColors.primary),
      ),
      child: Center(
        child: Text(
          title,
          style: miniStyle.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.primary),
        ),
      ),
    );
  }
}
