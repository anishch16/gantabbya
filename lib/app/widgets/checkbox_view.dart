import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

class CheckboxView extends StatelessWidget {
  final String title;
  final bool clicked;
  const CheckboxView({super.key, required this.title, required this.clicked});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(clicked?Icons.check_box:Icons.check_box_outline_blank_outlined,color: AppColors.primary,),
        const SizedBox(width: 8.0,),
        Text(title,style: AppTextStyles.smallStyle)
      ],
    );
  }
}
