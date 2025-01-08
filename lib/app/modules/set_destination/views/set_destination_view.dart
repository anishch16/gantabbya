import 'package:flutter/material.dart';
import 'package:gantabbya/app/constants/styles.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../widgets/custom_date_picker.dart';
import '../../../widgets/custom_dropdown2.dart';
import '../controllers/set_destination_controller.dart';

class SetDestinationView extends GetView<SetDestinationController> {
  const SetDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          // Get.toNamed(Routes.SET_DESTINATION);
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
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
                const SizedBox(height: 20),
                Obx(() {
                  return CustomDropdownButton2(
                    title: "Select Food Type",
                    hint: 'Select an option',
                    value: controller.selectedFoodType.value,
                    dropdownItems: controller.foodType,
                    onChanged: (value) {
                      controller.selectedFoodType.value = value ?? "";
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
                const SizedBox(height: 20),
                Obx(() {
                  return CustomDropdownButton2(
                    title: "Select Stay Type",
                    hint: 'Select an option',
                    value: controller.selectedLodgingType.value,
                    dropdownItems: controller.lodgingType,
                    onChanged: (value) {
                      controller.selectedLodgingType.value = value ?? "";
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
                Text(
                  "Start Date",
                  style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomDatePicker(title: 'Start Date', date: controller.startDate),
                const SizedBox(height: 20),
                Text(
                  "End Date",
                  style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomDatePicker(title: 'End Date', date: controller.endDate)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
