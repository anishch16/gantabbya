import 'package:flutter/material.dart';
import 'package:gantabbya/app/constants/styles.dart';
import 'package:gantabbya/app/data/remote/models/bus_air_hotel_model.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_date_picker.dart';
import '../../cost_details/views/cost_details_view.dart';
import '../controllers/args_model.dart';
import '../controllers/set_destination_controller.dart';
import 'card_shimmer.dart';

class SetDestinationView extends GetView<SetDestinationController> {
  const SetDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover)),
      child: Obx(() {
        return Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: GestureDetector(
            onTap: controller.letsCalculateEnabled.value
                ? () {
                    TravelCostDetails travelDetails = TravelCostDetails(
                        startDate: controller.startDate.value.text,
                        endDate: controller.endDate.value.text,
                        optimalAir: controller.highestRatedAir.value,
                        optimalBus: controller.highestRatedBus.value,
                        optimalLodge: controller.highestRatedHotel.value,
                        selectedBus: controller.selectedBusesModel.value,
                        selectedAir: controller.selectedAirlineModel.value,
                        selectedLodge: controller.selectedLodgeModel.value,
                        location: controller.arguments["name"] ?? "");
                    Get.offAllNamed(Routes.ESTIMATED_COST,
                        arguments: travelDetails);
                    // if (controller.busOrAirline.value) {
                    //   controller.postAirlineChoices();
                    //   controller.postLodgingChoices();
                    // } else {
                    //   controller.postLodgingChoices();
                    //   controller.postBusChoices();
                    // }
                  }
                : null,
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: controller.letsCalculateEnabled.value
                    ? Colors.teal
                    : Colors.grey,
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
              style: AppTextStyles.smallStyle.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.white),
            ),
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            iconTheme: const IconThemeData(color: AppColors.white),
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
                    style: AppTextStyles.smallStyle.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.white),
                  ),
                  const SizedBox(height: 10),
                  CustomDatePicker(
                    title: 'Start Date',
                    date: controller.startDate,
                    onChanged: (value) {
                      if (controller.startDate.value.text.isNotEmpty) {
                        controller.startDateFilled.value = true;
                      }
                      controller.letsCalculate();
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "End Date",
                    style: AppTextStyles.smallStyle.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.white),
                  ),
                  const SizedBox(height: 10),
                  CustomDatePicker(
                    title: 'End Date',
                    date: controller.endDate,
                    onChanged: (value) {
                      if (controller.endDate.value.text.isNotEmpty) {
                        controller.endDateFilled.value = true;
                      }
                      controller.letsCalculate();
                    },
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (controller.airlineData.value.data?.isNotEmpty ??
                        false) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.white,
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              (controller.busOrAirline.value)
                                  ? "Airlines Selected"
                                  : "Bus Selected",
                              style: AppTextStyles.smallStyle
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Switch(
                                value: controller.busOrAirline.value,
                                onChanged: (bool value) {
                                  controller.busOrAirline.value = value;
                                }),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (controller.busOrAirline.value) {
                      if (controller.airlinesLoading.value) {
                        return const Center(child: CardShimmer());
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Airlines Choices",
                              style: AppTextStyles.smallStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            (controller.airlineData.value.data?.isNotEmpty ??
                                    false)
                                ? ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    itemCount: controller
                                            .airlineData.value.data?.length ??
                                        0,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Obx(() {
                                        return TransportationCard(
                                          price: controller.airlineData.value
                                                  .data?[index].price
                                                  .toString() ??
                                              "0",
                                          remarks: controller.airlineData.value
                                                  .data?[index].remarks ??
                                              "",
                                          onTap: () {
                                            controller.selectedAirline.value =
                                                index;
                                            controller.selectedAirlineModel
                                                .value = controller.busesData
                                                    .value.data?[index] ??
                                                BusAirHotelData();
                                            controller.letsCalculate();
                                          },
                                          isSelected: controller
                                                  .selectedAirline.value ==
                                              index,
                                          startPoint: "Kathmandu",
                                          endPoint: controller.airlineData.value
                                                  .data?[index].name ??
                                              "",
                                          startTime: "",
                                          endTime: "",
                                          title: controller.airlineData.value
                                                  .data?[index].name ??
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
                                  )
                                : const NoDataView(title: "No Airlines Found"),
                          ],
                        );
                      }
                    } else {
                      if (controller.busesLoading.value) {
                        return const Center(child: CardShimmer());
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bus Choices",
                              style: AppTextStyles.smallStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                            ),
                            (controller.busesData.value.data?.isNotEmpty ??
                                    false)
                                ? ListView.separated(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    itemCount: controller
                                            .busesData.value.data?.length ??
                                        0,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Obx(() {
                                        return TransportationCard(
                                          price: controller.busesData.value
                                                  .data?[index].price
                                                  .toString() ??
                                              "0",
                                          remarks: controller.busesData.value
                                                  .data?[index].remarks ??
                                              "",
                                          onTap: () {
                                            controller.selectedBus.value =
                                                index;
                                            controller.selectedBusesModel
                                                .value = controller.busesData
                                                    .value.data?[index] ??
                                                BusAirHotelData();
                                            controller.letsCalculate();
                                          },
                                          isSelected:
                                              controller.selectedBus.value ==
                                                  index,
                                          startPoint: "Kathmandu",
                                          endPoint:
                                              controller.arguments["name"],
                                          startTime: "",
                                          endTime: "",
                                          title: controller.busesData.value
                                                  .data?[index].name ??
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
                                        const SizedBox(height: 16),
                                  )
                                : const NoDataView(title: "No Buses Found"),
                          ],
                        );
                      }
                    }
                  }),
                  if (controller.hotelData.value.data?.isNotEmpty ?? false)
                    const SizedBox(height: 20),
                  Obx(() {
                    if (controller.hotelLoading.value) {
                      return const Center(child: CardShimmer());
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lodging Choices",
                            style: AppTextStyles.smallStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white),
                          ),
                          const SizedBox(height: 10),
                          (controller.hotelData.value.data?.isNotEmpty ?? false)
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.hotelData.value.data?.length ??
                                          0,
                                  physics: const NeverScrollableScrollPhysics(),
                                  primary: false,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 16),
                                  itemBuilder: (context, index) => Obx(() {
                                    return HotelCard(
                                      price: controller.hotelData.value
                                              .data?[index].price
                                              .toString() ??
                                          "0",
                                      title: controller.hotelData.value
                                              .data?[index].name ??
                                          "",
                                      subTitle: controller.hotelData.value
                                              .data?[index].remarks ??
                                          "",
                                      isSelected:
                                          controller.selectedLodge.value ==
                                              index,
                                      onTap: () {
                                        controller.selectedLodge.value = index;
                                        controller.selectedLodgeModel.value =
                                            controller.hotelData.value
                                                    .data?[index] ??
                                                BusAirHotelData();
                                        controller.letsCalculate();
                                      },
                                    );
                                  }),
                                )
                              : const NoDataView(title: "No Lodging Found"),
                        ],
                      );
                    }
                  }),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class NoDataView extends StatelessWidget {
  final String title;

  const NoDataView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        border: Border.all(color: AppColors.grey),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
