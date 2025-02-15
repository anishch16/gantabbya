import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gantabbya/app/data/remote/api_urls.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/images.dart';
import '../../../constants/styles.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/greetings.dart';
import '../../../utils/preview_image_card.dart';
import '../controllers/home_controller.dart';
import 'image_shimmer.dart';
import 'loading_list.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.SET_DESTINATION, arguments: {
                  "destination": "",
                });
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal,
                ),
                child: Center(child: Text("Let's plan a travel", style: AppTextStyles.miniStyle.copyWith(fontSize: 16.sp, color: Colors.white))),
              ))
          .animate(
            delay: 2000.ms,
            onPlay: (controller) => controller.repeat(period: const Duration(seconds: 5)),
          )
          .shimmer(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
          ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: Stack(
                    children: [
                      Image.asset(
                        AppImages.planeBackground,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("${getGreetingMessage()} ${controller.localData.read("user") ?? ""}",
                                    style: InRiaTextStyles.mediumStyle.copyWith(color: Colors.white)),
                                const SizedBox(width: 8),
                                Icon(
                                  getGreetingIcon(),
                                  size: 24,
                                  color: getGreetingColor(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                // const Icon(
                                //   Icons.notifications,
                                //   size: 24,
                                //   color: Colors.white,
                                // ),
                                // SizedBox(width: 16),
                                GestureDetector(
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: "Logout",
                                      middleText: "Are you sure you want to logout?",
                                      confirm: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.teal,
                                        ),
                                        onPressed: () {
                                          controller.localData.write("isLoggedIn", false);
                                          controller.localData.write("access_token", null);
                                          Get.offAllNamed(Routes.LOGIN);
                                          Get.back();
                                        },
                                        child: Text(
                                          "Yes",
                                          style: AppTextStyles.smallStyle.copyWith(color: Colors.white),
                                        ),
                                      ),
                                      cancel: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.teal,
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          "No",
                                          style: AppTextStyles.smallStyle.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.logout,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text("Plan Your Trip With Us!",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ))),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      return Obx(() {
                        return ElevatedButton(
                          onPressed: () {
                            controller.imageIndex.value = index;
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(56, 40),
                            backgroundColor: controller.imageIndex.value == index ? Colors.teal : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            ["Lakes", "Mountains", "Temples", "Rivers"][index],
                            style: AppTextStyles.smallStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() {
                  if (controller.isImageLoading.value) {
                    return const ImageShimmer();
                  } else {
                    final selectedCategory = ["lake", "mountain", "temple", "river"][controller.imageIndex.value];
                    final List images = controller.nepalNatureData.value.data?.where((item) => item.slug == selectedCategory).toList().map((item) => item.url ?? "").toList() ?? [];
                    final List text = controller.nepalNatureData.value.data?.where((item) => item.slug == selectedCategory).toList().map((item) => item.name ?? "").toList() ?? [];
                    return CarouselSlider(
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
                      ),
                      items: images
                          .asMap()
                          .map((index, imageUrl) {
                            return MapEntry(
                              index,
                              Stack(
                                children: [
                                  PreviewCardImage(
                                    radius: 16,
                                    height: 200.0,
                                    width: double.infinity,
                                    url: imageUrl,
                                    errorImage: const AssetImage(ApiUrls.dummyDestinationImage),
                                  ),
                                  Positioned(
                                    bottom: 8.0,
                                    left: 16.0,
                                    child: Text(
                                      text[index] ?? "",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                          .values
                          .toList(),
                    );
                  }
                }),
                const SizedBox(height: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Destination",
                            style: AppTextStyles.normalStyle.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                    ),
                    Obx(() => controller.isLoading.value
                        ? const LoadingList()
                        : SizedBox(
                            height: 250,
                            child: ListView.builder(
                              itemCount: controller.destinationData.value.data?.length ?? 0,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    index == 0 ? const SizedBox(width: 8) : const SizedBox(),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.DETAIL_DESTINATION, arguments: controller.destinationData.value.data?[index]
                                        );
                                      },
                                      child: Container(
                                        width: 170,
                                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0.2,
                                              blurRadius: 0.2,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(16),
                                              child: PreviewCardImage(
                                                height: 110,
                                                width: 170,
                                                url: controller.destinationData.value.data?[index].image ?? "",
                                                errorImage: const AssetImage(
                                                  ApiUrls.dummyDestinationImage,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8.0),
                                            Text(
                                              controller.destinationData.value.data?[index].name ?? "",
                                              style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                            ),
                                            const SizedBox(height: 8.0),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  size: 16,
                                                ),
                                                Text(
                                                  "Nepal",
                                                  style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.bold),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8.0),
                                            StarRating(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                color: Colors.amber,
                                                rating: double.parse(controller.destinationData.value.data?[index].popularity.toString() ?? "0")),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ))),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.ALL_DESTINATION);
                          },
                          child: Text(
                            "See All",
                            style: AppTextStyles.normalStyle.copyWith(fontWeight: FontWeight.w600, color: Colors.teal),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
