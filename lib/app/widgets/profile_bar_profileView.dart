import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

class ProfileBarProfileView extends StatelessWidget {
  final String title;
  const ProfileBarProfileView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: normalStyle.copyWith(color: AppColors.primary,fontWeight: FontWeight.w600),
      ),
      // automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.primary,
      centerTitle: false,
      elevation: 0,
    );
  }
}
