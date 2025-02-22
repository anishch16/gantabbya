import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../data/remote/api_urls.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/preview_image_card.dart';
import '../controllers/all_destination_controller.dart';
import 'all_destination_shimmer.dart';

class AllDestinationView extends GetView<AllDestinationController> {
  const AllDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: AppColors.white),
            title: Form(
              child: TextFormField(
                onChanged: (value) {},
                style: AppTextStyles.smallStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
                controller: controller.searchController,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  filled: true,
                  hintStyle: AppTextStyles.smallStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  fillColor: const Color(0xFF979797).withOpacity(0.1),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: "Search destination",
                  prefixIcon: const  Icon(Icons.search,
                      color: AppColors.grey),
                ),
              ),
            ),
            scrolledUnderElevation: 0,
            elevation: 0,
            centerTitle: true,
          ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Obx(() {
              if (controller.isLoading.value) {
                return const AllDestinationShimmer();
              } else if (controller.filteredDestinations.isEmpty) {
                return const Center(child: Text('No destinations found'));
              } else {
                return AlignedGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  itemCount: controller.filteredDestinations.length,
                  padding: EdgeInsets.only(
                    bottom: Get.height * 0.5
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_DESTINATION,
                            arguments:
                                controller.destinationData.value.data?[index]);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: index == 10 ? 16 : 0),
                        decoration: BoxDecoration(
                            color: const Color(0xFF979797).withOpacity(0.1),
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
                                child: PreviewCardImage(
                                  height: 110,
                                  width: double.infinity,
                                  url: controller
                                          .filteredDestinations[index].image ??
                                      "",
                                  // radius: 16,
                                  errorImage: const AssetImage(
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
                                    controller
                                            .filteredDestinations[index].name ??
                                        "n/a",
                                    style: AppTextStyles.smallStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    controller.filteredDestinations[index]
                                            .description ??
                                        "",
                                    maxLines: 2,
                                    style: AppTextStyles.smallStyle.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        color: AppColors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(height: 8.0),
                                  StarRating(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      color: Colors.amber,
                                      borderColor: Colors.white,
                                      rating: double.parse(controller
                                              .destinationData
                                              .value
                                              .data?[index]
                                              .popularity
                                              .toString() ??
                                          "0")),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          )),
    );
  }
}
