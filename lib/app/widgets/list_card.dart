import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/date_formatter.dart';

class ListCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const ListCard({super.key, required this.image, required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 50,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Adaptive.w(60),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.smallStyle.copyWith(
                      fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                ),
                const SizedBox(height: 4.0),
                // Html(data: subtitle,
                //     style: {
                //   "body": Style(
                //     maxLines: 2,
                //       color: AppColors.black,
                //       textAlign: TextAlign.start,
                //       fontWeight: FontWeight.w400,
                //       fontSize: FontSize(AppDimens.small.sp))
                // }),
                const SizedBox(height: 4.0),
                Text("Published : ${TimeUtils().calculateTimeDifference(subtitle)}",
                  style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.w500,color: AppColors.grey),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.navigate_next,color: AppColors.primary)
          ],
        ),
      ),
    );  }
}
