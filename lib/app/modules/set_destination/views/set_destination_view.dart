import 'package:flutter/material.dart';
import 'package:gantabbya/app/constants/styles.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_date_picker.dart';
import '../../../widgets/custom_dropdown2.dart';
import '../../cost_details/views/cost_details_view.dart';
import '../controllers/set_destination_controller.dart';

class SetDestinationView extends GetView<SetDestinationController> {
  const SetDestinationView({super.key});

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
              child: Text("Let's calculate",
                  style: AppTextStyles.miniStyle
                      .copyWith(fontSize: 16, color: Colors.white))),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Your Journey's Info",
          style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Start Date",
                style: AppTextStyles.smallStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CustomDatePicker(title: 'Start Date', date: controller.startDate),
              const SizedBox(height: 20),
              Text(
                "End Date",
                style: AppTextStyles.smallStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CustomDatePicker(title: 'End Date', date: controller.endDate),
              // const SizedBox(height: 100),
              const SizedBox(height: 10),
              Obx(() {
                if (controller.airlinesLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Airlines Choices",
                        style: AppTextStyles.smallStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount:
                            controller.airlineData.value.data?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Obx(() {
                            return TransportationCard(
                              onTap: () {
                                controller.selectedTravel.value = index;
                              },
                              isSelected:
                                  controller.selectedTravel.value == index,
                              startPoint: "Kathmandu",
                              endPoint: controller
                                      .airlineData.value.data?[index].name ??
                                  "",
                              startTime: "",
                              endTime: "",
                              title: controller
                                      .airlineData.value.data?[index].remarks ??
                                  "",
                              icon: const Icon(
                                Icons.flight,
                                color: Colors.teal,
                                size: 40,
                              ),
                            );
                          });
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      ),
                    ],
                  );
                }
              }),
              Obx(() {
                if (controller.busesLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bus Choices",
                        style: AppTextStyles.smallStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: controller.busesData.value.data?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Obx(() {
                            return TransportationCard(
                              onTap: () {
                                controller.selectedTravel.value = index;
                              },
                              isSelected:
                                  controller.selectedTravel.value == index,
                              startPoint: "Kathmandu",
                              endPoint: controller
                                      .busesData.value.data?[index].name ??
                                  "",
                              startTime: "",
                              endTime: "",
                              title: controller
                                      .busesData.value.data?[index].remarks ??
                                  "",
                              icon: const Icon(
                                Icons.directions_bus,
                                color: Colors.teal,
                                size: 40,
                              ),
                            );
                          });
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                      ),
                    ],
                  );
                }
              }),
              if (controller.hotelData.value.data?.isNotEmpty ?? false)
                const SizedBox(height: 20),
              Text(
                "Lodging Choices",
                style: AppTextStyles.smallStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Obx(() {
                if (controller.hotelLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.hotelData.value.data?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    itemBuilder: (context, index) => Obx(() {
                      return HotelCard(
                        title:
                            controller.hotelData.value.data?[index].name ?? "",
                        subTitle:
                            controller.hotelData.value.data?[index].remarks ??
                                "",
                        isSelected: controller.selectedLodge.value == index,
                        onTap: () {
                          controller.selectedLodge.value = index;
                        },
                      );
                    }),
                  );
                }
              }),
              // const SizedBox(height: 20),
              // Text(
              //   "Fooding Choices",
              //   style: AppTextStyles.smallStyle
              //       .copyWith(fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 10),
              // GridView.builder(
              //   shrinkWrap: true,
              //   itemCount: 5,
              //   // padding: const EdgeInsets.symmetric(horizontal: 16),
              //   physics: const NeverScrollableScrollPhysics(),
              //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //     maxCrossAxisExtent: 150,
              //     childAspectRatio: 0.7,
              //     mainAxisSpacing: 5,
              //     crossAxisSpacing: 16,
              //   ),
              //   primary: false,
              //   itemBuilder: (context, index) => Obx(() {
              //     return FoodCard(
              //       isSelected: controller.selectedFood.value == index,
              //       onPress: () {
              //         controller.selectedFood.value = index;
              //       },
              //     );
              //   }),
              // ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
