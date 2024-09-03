import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';

class HomeCardView extends StatelessWidget {
  final String icon;
  final String title;
  const HomeCardView({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.5,
      color: AppColors.white,
      borderRadius: BorderRadius.circular(20),
      child: Container(

        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 10.0),
            Text(title,style: smallStyle.copyWith(fontWeight: FontWeight.bold))
          ],
        ),


      ),
    );
  }
}
