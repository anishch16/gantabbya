import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gantabbya/app/data/remote/api_urls.dart';
import 'package:gantabbya/app/utils/preview_image_card.dart';

import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../routes/app_pages.dart';
import '../controllers/cost_details_controller.dart';

class CostDetailsView extends GetView<CostDetailsController> {
  const CostDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> transportationData = [
      {
        "startPoint": "Kathmandu",
        "endPoint": "Pokhara",
        "startTime": "1:00 PM",
        "endTime": "5:00 PM",
        "title": "Flight Cost",
        "icon": RotatedBox(
          quarterTurns: 1,
          child: Icon(
            Icons.flight,
            color: Colors.teal,
            size: 40,
          ),
        ),
      },
      {
        "startPoint": "Kathmandu",
        "endPoint": "Pokhara",
        "startTime": "1:00 PM",
        "endTime": "5:00 PM",
        "title": "Bus Cost",
        "icon": Icon(
          Icons.directions_bus_filled,
          color: Colors.teal,
          size: 40,
        ),
      },
      {
        "startPoint": "Kathmandu",
        "endPoint": "Pokhara",
        "startTime": "1:00 PM",
        "endTime": "5:00 PM",
        "title": "Taxi Cost",
        "icon": Icon(
          Icons.local_taxi,
          color: Colors.teal,
          size: 40,
        ),
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.ESTIMATED_COST);
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.teal,
          ),
          child: Center(
              child: Text("Final Trip Cost",
                  style: AppTextStyles.miniStyle
                      .copyWith(fontSize: 16, color: Colors.white))),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "All Cost Details",
          style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Transportation Choices",
                style: AppTextStyles.smallStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: transportationData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final data = transportationData[index];
                return Obx(() {
                  return TransportationCard(
                    price: "",
                    onTap: () {
                      controller.selectedTravel.value = index;
                    },
                    isSelected: controller.selectedTravel.value == index,
                    startPoint: data['startPoint'],
                    endPoint: data['endPoint'],
                    startTime: data['startTime'],
                    endTime: data['endTime'],
                    title: data['title'],
                    icon: data['icon'],
                    remarks: "jhjsdhfjs",
                  );
                });
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Lodging Choices",
                style: AppTextStyles.smallStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 0.7,
                mainAxisSpacing: 5,
                crossAxisSpacing: 16,
              ),
              primary: false,
              itemBuilder: (context, index) => Obx(() {
                return FoodCard(
                  isSelected: controller.selectedLodge.value == index,
                  onPress: () {
                    controller.selectedLodge.value = index;
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Fooding Choices",
                style: AppTextStyles.smallStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 5,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 0.7,
                mainAxisSpacing: 5,
                crossAxisSpacing: 16,
              ),
              primary: false,
              itemBuilder: (context, index) => Obx(() {
                return FoodCard(
                  isSelected: controller.selectedFood.value == index,
                  onPress: () {
                    controller.selectedFood.value = index;
                  },
                );
              }),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class TransportationCard extends StatelessWidget {
  final String startPoint;
  final String endPoint;
  final String startTime;
  final String endTime;
  final String title;
  final String remarks;
  final String price;
  final Widget icon;
  final bool isSelected;
  final void Function() onTap;

  const TransportationCard({
    super.key,
    required this.startPoint,
    required this.endPoint,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.remarks,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: isSelected ? Colors.green : Colors.transparent),
            borderRadius: BorderRadius.circular(16),
            color: isSelected ? Colors.green.shade50 : AppColors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 1,
                color: AppColors.black.withOpacity(0.3),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(title,
                      maxLines: 1,
                      style: AppTextStyles.smallStyle
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 10),
                Text("Rs. $price",
                    style: AppTextStyles.smallStyle.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.circle_rounded,
                  color: Colors.teal,
                  size: 20,
                ),
                const Flexible(
                  child: DottedLine(
                    dashLength: 10,
                    dashColor: Colors.teal,
                    lineThickness: 2,
                    dashGapLength: 8,
                  ),
                ),
                icon,
                const Flexible(
                  child: DottedLine(
                    dashLength: 10,
                    dashColor: Colors.teal,
                    lineThickness: 2,
                    dashGapLength: 8,
                  ),
                ),
                const Icon(
                  Icons.circle_rounded,
                  color: Colors.teal,
                  size: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(12),
                      color:
                          isSelected ? Colors.green.shade50 : AppColors.white,
                    ),
                    child: Text(startPoint, style: AppTextStyles.smallStyle)),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(12),
                      color:
                          isSelected ? Colors.green.shade50 : AppColors.white,
                    ),
                    child: Text(endPoint, style: AppTextStyles.smallStyle)),
              ],
            ),
            const SizedBox(height: 10),
            Text(remarks,
                style: AppTextStyles.smallStyle
                    .copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    this.width = 140,
    required this.onPress,
    required this.isSelected,
  });

  final double width;
  final bool isSelected;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(
              color: isSelected
                  ? Colors.tealAccent
                  : AppColors.grey.withOpacity(0.3),
              width: 2),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 1,
              color: AppColors.grey.withOpacity(0.1),
            )
          ],
          borderRadius: BorderRadius.circular(12)),
      width: double.infinity,
      child: GestureDetector(
        onTap: onPress,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PreviewCardImage(
              width: double.infinity,
              radius: 12,
              url: ApiUrls.dummyHotelImage,
              errorImage: AssetImage(
                ApiUrls.dummyDestinationImage,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Veg Item",
              style: AppTextStyles.smallStyle
                  .copyWith(fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            Text("\$${100}",
                style: AppTextStyles.smallStyle.copyWith(
                    color: AppColors.redAccent, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  final bool isSelected;
  final void Function() onTap;

  const HotelCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isSelected,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: isSelected ? Colors.green : Colors.transparent),
            borderRadius: BorderRadius.circular(16),
            color: isSelected ? Colors.green.shade50 : AppColors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 1,
                color: AppColors.black.withOpacity(0.3),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: AppTextStyles.smallStyle
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(subTitle,
                style: AppTextStyles.smallStyle.copyWith(
                    color: AppColors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Rs. $price",
                style: AppTextStyles.smallStyle.copyWith(
                    color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
