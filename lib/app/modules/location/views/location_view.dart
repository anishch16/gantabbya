import 'package:flutter/material.dart';
import 'package:gantabbya/app/constants/styles.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  LocationView({super.key});

  @override
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          controller.submitForm();
        },
        child: Container(
          height: 56,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.cyan.shade500,
          ),
          child: Center(child: Text('Submit', style: AppTextStyles.normalStyle)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
                bottom: false, child: Text("Favorite Trips", style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18.sp, color: Colors.black)))),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Start Location
                    Obx(() => _buildDropdown('Starting Location', controller.startLocation.value, controller.locations,
                        (newValue) => controller.startLocation.value = newValue!)),

                    // End Location
                    Obx(() => _buildDropdown(
                        'End Location', controller.endLocation.value, controller.locations, (newValue) => controller.endLocation.value = newValue!)),

                    // Start Date
                    Row(
                      children: [
                        Obx(() => _buildDateField('Start Date', controller.startDate.value, () {
                              controller.selectDate(context, controller.startDate);
                            })),

                        // End Date
                        Obx(() => _buildDateField('End Date', controller.endDate.value, () {
                              controller.selectDate(context, controller.endDate);
                            })),
                      ],
                    ),

                    // Transportation
                    Obx(() => _buildDropdown('Means of Transportation', controller.transportation.value, controller.transportationOptions,
                        (newValue) => controller.transportation.value = newValue!)),

                    // Food Type
                    Obx(() => _buildDropdown(
                        'Type of Food', controller.foodType.value, controller.foodTypes, (newValue) => controller.foodType.value = newValue!)),

                    // Hotel Selection
                    Obx(() => _buildDropdown('Hotel Selection', controller.hotelSelection.value, controller.hotelTypes,
                        (newValue) => controller.hotelSelection.value = newValue!)),

                    const SizedBox(height: 100.0),

                    // Submit Button
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dropdown Builder
  Widget _buildDropdown(String label, String value, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
            value: value.isEmpty ? null : value,
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Date Field Builder
  Widget _buildDateField(String label, DateTime selectedDate, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                '${selectedDate.toLocal()}'.split(' ')[0],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
