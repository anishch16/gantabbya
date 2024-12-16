import 'package:flutter/cupertino.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

class TitleOfForm extends StatelessWidget {
  final String title;
  const TitleOfForm({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.normalStyle.copyWith(
                color: AppColors.black, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
        ],
    ),
      );
  }
}
