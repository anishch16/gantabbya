import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
class SmallButton extends StatelessWidget {
  final String title;
  const SmallButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.primary,
      ),
      child: Center(
        child: Text(
          title,
          style: miniStyle.copyWith(
              fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
