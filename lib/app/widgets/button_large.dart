import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

class LargeButton extends StatelessWidget {

  final String title;

  const LargeButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.black,
      ),
      child: Center(
        child: Text(title,
            style: AppTextStyles.normalStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.w500)),
      ),
    );  }
}
