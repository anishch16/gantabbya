import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../data/remote/api_urls.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/preview_image_card.dart';
import '../../set_destination/views/set_destination_view.dart';
import '../controllers/all_destination_controller.dart';

class AllDestinationView extends GetView<AllDestinationController> {
  const AllDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Form(
            child: TextFormField(
              onChanged: (value) {},
              decoration: InputDecoration(
                filled: true,
                hintStyle: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold, color: const Color(0xFF757575)),
                fillColor: const Color(0xFF979797).withOpacity(0.1),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search destination",
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: AlignedGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            itemCount: 11,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_DESTINATION);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: index == 10 ? 16 : 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.2,
                          blurRadius: 0.2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: const PreviewCardImage(
                            height: 110,
                            width: double.infinity,
                            url: ApiUrls.dummyDestinationImage,
                            // radius: 16,
                            errorImage: AssetImage(
                              ApiUrls.dummyDestinationImage,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pashupatinath Temple",
                              style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                ),
                                Text(
                                  "Nepal",
                                  style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "5.0",
                                      style: AppTextStyles.smallStyle.copyWith(color: AppColors.darkYellow, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 4.0),
                                    const Icon(
                                      Icons.star_rounded,
                                      color: AppColors.darkYellow,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.teal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
