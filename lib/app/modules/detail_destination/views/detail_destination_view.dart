import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:gantabbya/app/modules/detail_destination/views/weather_shimmer.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../data/remote/api_urls.dart';
import '../../../data/remote/models/weather_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/preview_image_card.dart';
import '../controllers/detail_destination_controller.dart';

class DetailDestinationView extends GetView<DetailDestinationController> {
  const DetailDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            controller.data.name ?? "",
            style: AppTextStyles.smallStyle
                .copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          scrolledUnderElevation: 0,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: AppColors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            Get.toNamed(
              Routes.SET_DESTINATION,
              arguments: {
                "location": controller.data.id,
                "name": controller.data.name
              },
            );
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.teal,
            ),
            child: Center(
                child: Text("Let's make a plan",
                    style: AppTextStyles.miniStyle
                        .copyWith(fontSize: 16, color: Colors.white))),
          ),
        )
            .animate(
              delay: 2000.ms,
              onPlay: (controller) =>
                  controller.repeat(period: const Duration(seconds: 5)),
            )
            .shimmer(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
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
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      controller.imageIndex.value = index;
                    }),
                items: List<String>.from([controller.data.image] ?? [])
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
                          margin: EdgeInsets.symmetric(
                              horizontal: isSelected ? 6 : 3),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? AppColors.black : AppColors.grey,
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
                              color: AppColors.white,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              controller.data.location ?? "",
                              style: AppTextStyles.smallStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        StarRating(
                            mainAxisAlignment: MainAxisAlignment.start,
                            color: Colors.amber,
                            rating: controller.data.popularity ?? 0.0),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ReadMoreText(
                      controller.data.description ?? "",
                      trimLines: 8,
                      style: AppTextStyles.smallStyle.copyWith(
                        color: AppColors.white,
                      ),
                      colorClickableText: AppColors.redAccent,
                      textAlign: TextAlign.justify,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Show more',
                      trimExpandedText: ' Show less',
                      lessStyle: AppTextStyles.smallStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.redAccent),
                      moreStyle: AppTextStyles.smallStyle
                          .copyWith(fontWeight: FontWeight.bold,
                      color: Colors.teal
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "This Week Weather",
                      style: AppTextStyles.smallStyle.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.white),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      if (controller.weatherLoading.value) {
                        return const WeatherShimmer();
                      } else {
                        return buildSevenDayForecastList(
                            controller.weatherData.value, size);
                      }
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSevenDayForecast(
    String day, int minTemp, int maxTemp, IconData weatherIcon, Size size) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          Text(
            day, // Displaying day (Mon, Tue, etc.)
            style: AppTextStyles.smallStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.25,
            ),
            child: FaIcon(
              weatherIcon,
              color: AppColors.white,
              size: 20,
            ),
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.15,
              ),
              child: Text('$minTemp˚C',
                  style: AppTextStyles.smallStyle.copyWith(
                    color: AppColors.white,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: Text('$maxTemp˚C',
                  style: AppTextStyles.smallStyle.copyWith(
                    color: AppColors.white,
                  )),
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

Widget buildSevenDayForecastList(WeatherData weatherData, Size size) {
  var hourly = weatherData.hourly;
  var timeList = hourly?.time ?? [];
  var temperatureList = hourly?.temperature2m ?? [];
  List<Widget> forecastWidgets = [];
  List<String> daysOfWeek = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ]; // Static days

  for (int i = 0; i < 7; i++) {
    if (i < timeList.length) {
      String day = daysOfWeek[i];
      double temperature = temperatureList[i];
      int minTemp = temperature.toInt();
      int maxTemp = temperature.toInt();
      IconData weatherIcon = FontAwesomeIcons.sun;
      forecastWidgets
          .add(buildSevenDayForecast(day, minTemp, maxTemp, weatherIcon, size));
    }
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: forecastWidgets,
  );
}
