import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class ContainerForForm extends StatelessWidget {
  final Widget widget;
  final String? title;

  const ContainerForForm({super.key, required this.widget, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: widget,
                ),
              ],
            ),
          ),
            Positioned(
              left: 10,
              child: Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0,left: 4.0),
                  child: Text(
                    title!,
                      style: AppTextStyles.normalStyle.copyWith(
    color: AppColors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
