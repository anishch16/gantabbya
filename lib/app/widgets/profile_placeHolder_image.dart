import 'package:flutter/material.dart';

import '../constants/colors.dart';


class ProfilePlaceHolderImage extends StatelessWidget {
  final String title;
  final TextStyle style;
  const ProfilePlaceHolderImage({super.key, required this.title, required this.style});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        alignment: Alignment.center,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.withOpacity(0.8),
          ),
          child: Text(title,
            style: style.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white),)
      );
  }
}
