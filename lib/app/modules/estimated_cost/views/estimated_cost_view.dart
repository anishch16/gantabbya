import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gantabbya/app/modules/home/views/home_view.dart';

import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/estimated_cost_controller.dart';

class EstimatedCostView extends GetView<EstimatedCostController> {
  const EstimatedCostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/login_bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(onTap: () => Get.back(), child: const Icon(Icons.arrow_back, color: AppColors.white)),
            title: Text(
              "Plan your trip with us",
              style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
            ),
            scrolledUnderElevation: 0,
            elevation: 0,
            centerTitle: true,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton:
          GestureDetector(
            onTap: () {
              Get.offAllNamed(Routes.HOME);
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal,
              ),
              child: Center(child: Text("Back to Home", style: AppTextStyles.miniStyle.copyWith(fontSize: 16, color: Colors.white))),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(8),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 0.2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                      child: Image.asset(
                        AppImages.planeBackground,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImages.gantabyaLogoPng,
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                "Travel Choices",
                                style: AppTextStyles.normalStyle.copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "According to your choice",
                          style: AppTextStyles.normalStyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.appGrey.withOpacity(0.2)),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CostTextRow(
                                frontText: "Food",
                                backText: "200",
                              ),
                              CostTextRow(
                                frontText: "Travel",
                                backText: "200",
                              ),
                              CostTextRow(
                                frontText: "Lodging",
                                backText: "200",
                              ),
                              CostTextRow(
                                frontText: "Miscellaneous",
                                backText: "200",
                              ),
                              Divider(
                                height: 16,
                              ),
                              CostTextRow(
                                frontText: "Total",
                                backText: "800",
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Optimized Choices and Cost",
                          style: AppTextStyles.normalStyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.gray),
                              color: AppColors.appGrey.withOpacity(0.2)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Column(
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(
                                       children: [
                                         Transform.rotate(
                                             angle: -1.0472,
                                             child: const Icon(
                                               Icons.arrow_circle_right_rounded,
                                               color: AppColors.appGrey,
                                               size: 20,
                                             )),
                                         const SizedBox(width: 4),
                                         Text(
                                           "10 jan 2025",
                                           style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.bold, color: AppColors.grey),
                                         ),
                                       ],
                                     ),
                                     Row(
                                       children: [
                                         Transform.rotate(
                                             angle: 1.0472,
                                             child: const Icon(
                                               Icons.arrow_circle_right_rounded,
                                               color: AppColors.appGrey,
                                               size: 20,
                                             )),
                                         const SizedBox(width: 4),
                                         Text(
                                           "10 jan 2025",
                                           style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.bold, color: AppColors.grey),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Text(
                                       "POK",
                                       style: AppTextStyles.normalStyle.copyWith(fontWeight: FontWeight.bold),
                                     ),
                                     const Flexible(
                                       child: DottedLine(
                                         dashLength: 10,
                                         lineThickness: 2,
                                         dashGapLength: 8,
                                       ),
                                     ),
                                     const Icon(Icons.local_taxi),
                                     const Flexible(
                                       child: DottedLine(
                                         dashLength: 10,
                                         lineThickness: 2,
                                         dashGapLength: 8,
                                       ),
                                     ),
                                     Text(
                                       "KAT",
                                       style: AppTextStyles.normalStyle.copyWith(fontWeight: FontWeight.bold),
                                     )
                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       "1:30 PM",
                                       style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.bold, color: AppColors.grey),
                                     ),
                                     Text(
                                       "5:30 PM",
                                       style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.bold, color: AppColors.grey),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                              const Divider(
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.appGrey.withOpacity(0.2)),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CostTextRow(
                                frontText: "Food",
                                backText: "200",
                              ),
                              CostTextRow(
                                frontText: "Travel",
                                backText: "200",
                              ),
                              CostTextRow(
                                frontText: "Lodging",
                                backText: "200",
                              ),
                              CostTextRow(
                                frontText: "Miscellaneous",
                                backText: "200",
                              ),
                              Divider(
                                height: 16,
                              ),
                              CostTextRow(
                                frontText: "Total",
                                backText: "800",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class CostTextRow extends StatelessWidget {
  final String frontText;
  final String backText;

  const CostTextRow({
    super.key,
    required this.frontText,
    required this.backText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            frontText,
            style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            "\$$backText",
            style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold, color: AppColors.green),
          ),
        ],
      ),
    );
  }
}
