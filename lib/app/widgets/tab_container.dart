import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
class TabContainer extends StatelessWidget {

  final bool isClicked;
  final String title;

  const TabContainer({super.key, required this.isClicked, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isClicked
            ? AppColors.primary
            : Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(color: AppColors.primary),
      ),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 18.0),
        child: Text(
          title,
          style: AppTextStyles.smallStyle.copyWith(
              fontWeight: isClicked
                  ? FontWeight.w700
                  : FontWeight.w400,
              color: isClicked
                  ? Colors.white
                  : AppColors.primary),
        ),
      ),
    );
  }
}
