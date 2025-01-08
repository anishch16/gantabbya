import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../data/remote/api_urls.dart';
import '../../../utils/preview_image_card.dart';
import '../controllers/detail_destination_controller.dart';

class DetailDestinationView extends GetView<DetailDestinationController> {
  const DetailDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    const minTemp = 20;
    const maxTemp = 20;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Pashupatinath Temple',
          style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.teal,
        ),
        child: Center(child: Text("Let's make a plan", style: AppTextStyles.miniStyle.copyWith(fontSize: 16, color: Colors.white))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              carouselController: controller.carouselController,
              options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    controller.imageIndex.value = index;
                  }),
              items: controller.imgList
                  .map(
                    (item) => PreviewCardImage(
                      radius: 16,
                      height: 200.0,
                      width: double.infinity,
                      url: item,
                      errorImage: const AssetImage(
                        ApiUrls.dummyDestinationImage,
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.imgList.length,
                  (index) {
                    bool isSelected = controller.imageIndex.value == index;
                    return GestureDetector(
                      onTap: () {
                        controller.carouselController.animateToPage(index);
                      },
                      child: AnimatedContainer(
                        width: isSelected ? 50 : 14,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: isSelected ? 6 : 3),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.black : AppColors.grey,
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                        ),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "Kathmandu",
                            style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star_rounded,
                            color: index < 2 ? AppColors.darkYellow : AppColors.grey,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ReadMoreText(
                    'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                    trimLines: 5,
                    style: AppTextStyles.smallStyle.copyWith(),
                    colorClickableText: AppColors.redAccent,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    lessStyle: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold, color: AppColors.redAccent),
                    moreStyle: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "This Week Weather",
                    style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSevenDayForecast(
                        "Today",
                        minTemp,
                        maxTemp,
                        FontAwesomeIcons.cloud,
                        size,
                      ),
                      buildSevenDayForecast(
                        "Wed",
                        -5,
                        5,
                        FontAwesomeIcons.sun,
                        size,
                      ),
                      buildSevenDayForecast(
                        "Thu",
                        -2,
                        7,
                        FontAwesomeIcons.cloudRain,
                        size,
                      ),
                      buildSevenDayForecast(
                        "Fri",
                        3,
                        10,
                        FontAwesomeIcons.sun,
                        size,
                      ),
                      buildSevenDayForecast(
                        "San",
                        5,
                        12,
                        FontAwesomeIcons.sun,
                        size,
                      ),
                      buildSevenDayForecast(
                        "Sun",
                        4,
                        7,
                        FontAwesomeIcons.cloud,
                        size,
                      ),
                      buildSevenDayForecast(
                        "Mon",
                        -2,
                        1,
                        FontAwesomeIcons.snowflake,
                        size,
                      ),
                      buildSevenDayForecast(
                        "Tues",
                        0,
                        3,
                        FontAwesomeIcons.cloudRain,
                        size,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

Widget buildSevenDayForecast(String time, int minTemp, int maxTemp, IconData weatherIcon, size) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          Text(
            time,
            style: AppTextStyles.smallStyle,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.25,
            ),
            child: FaIcon(
              weatherIcon,
              color: AppColors.black,
              size: 20,
            ),
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.15,
              ),
              child: Text('$minTemp˚C', style: AppTextStyles.smallStyle),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: Text('$maxTemp˚C', style: AppTextStyles.smallStyle),
            ),
          ),
        ],
      ),
      const Divider(
        color: AppColors.black,
        thickness: 0.5,
      ),
    ],
  );
}
