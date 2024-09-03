import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class FacilityCard extends StatelessWidget {
  final String image;
  final String title;
  final String no;
  const FacilityCard(
      {super.key, required this.image, required this.title, required this.no});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.2,
      color: AppColors.white,
      borderRadius: BorderRadius.circular(15.0),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    no,
                    style: mediumStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: miniStyle.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
