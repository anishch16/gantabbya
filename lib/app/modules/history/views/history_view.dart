import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: AppColors.white),
          title: Text(
            "Your Travel Catalog",
            style: AppTextStyles.smallStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          scrolledUnderElevation: 0,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) => const TravelCatalogCard(
            destinationName: "Lumbini",
            totalPrice: 2000,
            date: "12-01-2023",
            travelType: "By Bus",
            travelCompanyName: "Anish Travels and Tours",
            travelPrice: 200,
            lodgeName: "Anish Hotels and Lodge",
            lodgePrice: 200,
          ),
        ),
      ),
    );
  }
}

class TravelCatalogCard extends StatelessWidget {
  final String destinationName;
  final double totalPrice;
  final String date;
  final String travelType;
  final String travelCompanyName;
  final double travelPrice;
  final String lodgeName;
  final double lodgePrice;
  final VoidCallback? onTap;

  const TravelCatalogCard({
    super.key,
    required this.destinationName,
    required this.totalPrice,
    required this.date,
    required this.travelType,
    required this.travelCompanyName,
    required this.travelPrice,
    required this.lodgeName,
    required this.lodgePrice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.travel_explore,
              size: 200,
              color: AppColors.gray.withOpacity(0.1),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                destinationName,
                style: AppTextStyles.normalStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text("Total",
                      style: AppTextStyles.normalStyle
                          .copyWith(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text(
                    "Rs. ${totalPrice.toStringAsFixed(0)}",
                    style: AppTextStyles.normalStyle.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.green),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text("Date", style: AppTextStyles.normalStyle),
                  const Spacer(),
                  Text(date,
                      style: AppTextStyles.normalStyle.copyWith(
                          color: AppColors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(height: 16),
              Row(
                children: [
                  Text("Travel Choice", style: AppTextStyles.normalStyle),
                  const Spacer(),
                  Text(travelType,
                      style: AppTextStyles.normalStyle.copyWith(
                          color: AppColors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 4),
              Text(travelCompanyName,
                  style: AppTextStyles.smallStyle.copyWith(
                      color: AppColors.grey, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text("Price", style: AppTextStyles.smallStyle),
                  const Spacer(),
                  Text("Rs. ${travelPrice.toStringAsFixed(0)}",
                      style: AppTextStyles.smallStyle.copyWith(
                          color: AppColors.green, fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(height: 16),
              Text("Lodging Choice", style: AppTextStyles.normalStyle),
              const SizedBox(height: 4),
              Text(lodgeName,
                  style: AppTextStyles.smallStyle.copyWith(
                      color: AppColors.grey, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text("Price",
                      style: AppTextStyles.smallStyle
                          .copyWith(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text("Rs. ${lodgePrice.toStringAsFixed(0)}",
                      style: AppTextStyles.smallStyle.copyWith(
                          color: AppColors.green, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
