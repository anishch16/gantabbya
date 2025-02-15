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
    Map<String, List<Map<String, dynamic>>> nepalData = {
      "Lakes": [
        {"image": "https://www.footprintadventure.com/uploads/media/Lakes%20in%20Nepal/murma-viewpoint.jpg", "text": "Rara Lake"},
        {"image": "https://www.footprintadventure.com/uploads/media/Gokyo/gokyo-viewpoint.jpg", "text": "GOKYO LAKE"},
        {"image": "https://www.footprintadventure.com/uploads/media/Lakes%20in%20Nepal/tilicho-lake.jpg", "text": "TILICHO LAKE"},
        {"image": "https://www.nepalhightrek.com/wp-content/uploads/2023/10/goshaikunda-lake-trek-1024x416.jpg", "text": "GOSAIKUNDA LAKE"},
        {
          "image":
              "https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Beeshazari_Lake_of_Chitwan%2C_Nepal.jpg/396px-Beeshazari_Lake_of_Chitwan%2C_Nepal.jpg",
          "text": "BISH HAZARI LAKE"
        },
        {"image": "https://www.footprintadventure.com/uploads/media/Lakes%20in%20Nepal/tal-barahi.jpg", "text": "PHEWA TAL/LAKE"},
        {"image": "https://www.footprintadventure.com/uploads/media/Lakes%20in%20Nepal/panch-pokhari.jpg", "text": "PANCH POKHARI"},
      ],
      "Mountains": [
        {"image": "https://highlandexpeditions.com/wp-content/uploads/2024/08/Everest-2.jpg.webp", "text": "Mount Everest"},
        {"image": "https://highlandexpeditions.com/wp-content/uploads/2024/08/Kanchenjunga.jpg.webp", "text": "Kanchenjunga"},
        {"image": "https://highlandexpeditions.com/wp-content/uploads/2024/08/Lhotse-1.jpg.webp", "text": "Lhotse"},
        {"image": "https://highlandexpeditions.com/wp-content/uploads/2024/08/Makalu_CU.jpg.webp", "text": "Makalu"},
        {"image": "https://highlandexpeditions.com/wp-content/uploads/2024/08/Cho-Oyu-Expedition.jpg.webp", "text": "Cho Oyu"},
        {"image": "https://highlandexpeditions.com/wp-content/uploads/2024/08/Dhaulagiri.jpg.webp", "text": "Dhaulagiri"},
        {"image": "https://highlandexpeditions.com/wp-content/uploads/2024/08/Manaslu-2.jpg.webp", "text": "Manaslu"},
        {"image": "https://highlandexpeditions.com/wp-content/uploads/2024/08/Gyachung-Khang.jpg.webp", "text": "Gyachung Khang"},
        {"image": "https://highlandexpeditions.com/wp-content/uploads/2024/08/Annapurna-2.jpg.webp", "text": "Annapurna II"},
      ],
      "Temples": [
        {
          "image": "https://www.holidify.com/images/cmsuploads/compressed/shutterstock_627150563_20190822130709_20190822154343.jpg",
          "text": "Pashupatinath Temple"
        },
        {"image": "https://www.holidify.com/images/cmsuploads/compressed/BRP_Lumbini_Mayadevi_temple_20191003132624.jpg", "text": "Maya Devi Temple"},
        {
          "image":
              "https://www.holidify.com/images/cmsuploads/compressed/800px-Swayambhunath_Monkey_Temple_Nepal_IMG_8153_2018_32_20190822225416.jpg",
          "text": "Swayambhunath Temple"
        },
        {
          "image": "https://www.holidify.com/images/cmsuploads/compressed/21983642252_a40fdfb7f5_b_20180927122417_20180927122432.jpg",
          "text": "Dakshinkali Temple"
        },
        {
          "image": "https://www.holidify.com/images/cmsuploads/compressed/8568905000_b259fb2088_b_20190503201520.jpg",
          "text": "Changu Narayan Temple"
        },
        {"image": "https://www.holidify.com/images/cmsuploads/compressed/budhanilkanthatemple_20180710135252.JPG", "text": "Budhanilkantha Temple"},
        {
          "image": "https://www.holidify.com/images/cmsuploads/compressed/saswatdham-banner-1_20181013153753_20181013153840.jpg",
          "text": "Shashwat Dham Temple"
        },
        {"image": "https://www.holidify.com/images/cmsuploads/compressed/shutterstock_647026006_20190822122032.jpg", "text": "Boudhanath Stupa"},
      ],
      "Treks": [
        {"image": "https://basecampadventure.com/wp-content/uploads/2018/04/Annapurna-Circuit-Trek-Map.jpg", "text": "Annapurna Circuit Trek"},
      ],
      "Rivers": [
        {"image": "https://www.mytripnepal.com/wp-content/uploads/2019/10/Karnali-River.jpg", "text": "Karnali River"},
      ],
    };

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
                    itemCount: 5,
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
                            ["Lakes", "Mountains", "Temples", "Treks", "Rivers"][index],
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
                    final selectedCategory = ["lake", "mountain", "temple", "trek", "river"][controller.imageIndex.value];
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
