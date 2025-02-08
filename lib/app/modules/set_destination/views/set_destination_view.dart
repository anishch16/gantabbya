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
          child: Center(child: Text("Let's calculate", style: AppTextStyles.miniStyle.copyWith(fontSize: 16, color: Colors.white))),
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
              Obx(() {
                controller.selectedDestination.value = Get.arguments["destination"];
                return CustomDropdownButton2(
                  title: "Select Destination",
                  hint: 'Select an option',
                  value: controller.selectedDestination.value,
                  dropdownItems: controller.destinations,
                  onChanged: (value) {
                    controller.selectedDestination.value = value ?? "";
                  },
                  hintAlignment: Alignment.centerLeft,
                  valueAlignment: Alignment.centerLeft,
                  buttonHeight: 50,
                  buttonWidth: (MediaQuery.of(context).size.width - 32),
                  iconEnabledColor: Colors.black,
                  dropdownHeight: 200,
                  dropdownWidth: (MediaQuery.of(context).size.width - 32),
                );
              }),
              // const SizedBox(height: 20),
              // Obx(() {
              //   return CustomDropdownButton2(
              //     title: "Select Food Type",
              //     hint: 'Select an option',
              //     value: controller.selectedFoodType.value,
              //     dropdownItems: controller.foodType,
              //     onChanged: (value) {
              //       controller.selectedFoodType.value = value ?? "";
              //     },
              //     hintAlignment: Alignment.centerLeft,
              //     valueAlignment: Alignment.centerLeft,
              //     buttonHeight: 50,
              //     buttonWidth: (MediaQuery.of(context).size.width - 32),
              //     iconEnabledColor: Colors.black,
              //     dropdownHeight: 200,
              //     dropdownWidth: (MediaQuery.of(context).size.width - 32),
              //   );
              // }),
              // const SizedBox(height: 20),
              // Obx(() {
              //   return CustomDropdownButton2(
              //     title: "Select Stay Type",
              //     hint: 'Select an option',
              //     value: controller.selectedLodgingType.value,
              //     dropdownItems: controller.lodgingType,
              //     onChanged: (value) {
              //       controller.selectedLodgingType.value = value ?? "";
              //     },
              //     hintAlignment: Alignment.centerLeft,
              //     valueAlignment: Alignment.centerLeft,
              //     buttonHeight: 50,
              //     buttonWidth: (MediaQuery.of(context).size.width - 32),
              //     iconEnabledColor: Colors.black,
              //     dropdownHeight: 200,
              //     dropdownWidth: (MediaQuery.of(context).size.width - 32),
              //   );
              // }),
              const SizedBox(height: 20),
              Text(
                "Total Individuals",
                style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: TextFormField(
                  style: AppTextStyles.smallStyle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "For eg: 5",
                    hintStyle: AppTextStyles.smallStyle.copyWith(color: AppColors.grey.shade500),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Text(
              //   "Start Date",
              //   style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 10),
              // CustomDatePicker(title: 'Start Date', date: controller.startDate),
              // const SizedBox(height: 20),
              // Text(
              //   "End Date",
              //   style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 10),
              // CustomDatePicker(title: 'End Date', date: controller.endDate),
              // const SizedBox(height: 100),
              const SizedBox(height: 10),
              if(controller.selectedDestination.value.isNotEmpty)
              Text(
                "Transportation Choices",
                style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              if(controller.selectedDestination.value.isNotEmpty)
                ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: transportationData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final data = transportationData[index];
                  return Obx(() {
                    return TransportationCard(
                      onTap: (){
                        controller.selectedTravel.value = index;
                      },
                      isSelected: controller.selectedTravel.value == index,
                      startPoint: data['startPoint'],
                      endPoint: data['endPoint'],
                      startTime: data['startTime'],
                      endTime: data['endTime'],
                      title: data['title'],
                      icon: data['icon'],
                    );
                  });
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10),
              ),
              if(controller.selectedDestination.value.isNotEmpty)
                const SizedBox(height: 20),
              Text(
                "Lodging Choices",
                style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                // padding: const EdgeInsets.symmetric(horizontal: 16),
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
                itemBuilder: (context, index) =>
                    Obx(() {
                      return FoodCard(
                        isSelected: controller.selectedLodge.value == index,
                        onPress: () {
                          controller.selectedLodge.value = index;
                        },
                      );
                    }),
              ),
              const SizedBox(height: 20),
              Text(
                "Fooding Choices",
                style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 5,
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 16,
                ),
                primary: false,
                itemBuilder: (context, index) =>
                    Obx(() {
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
      ),
    );
  }
}
