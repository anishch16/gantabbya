import 'package:flutter/material.dart';
import 'package:gantabbya/app/data/remote/api_urls.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/styles.dart';
import '../../../utils/greetings.dart';
import '../../../utils/preview_image_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
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
                            Text("${getGreetingMessage()}, Anish", style: InRiaTextStyles.mediumStyle.copyWith(color: Colors.white)),
                            const SizedBox(width: 8),
                            Icon(
                              getGreetingIcon(),
                              size: 24,
                              color: getGreetingColor(),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.notifications,
                              size: 24,
                              color: Colors.white,
                            ),
                            SizedBox(width: 16),
                            Icon(
                              Icons.menu,
                              size: 24,
                              color: Colors.white,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Center(child: Text("Kathmandu", style: AppTextStyles.miniStyle.copyWith(fontSize: 16.sp, color: Colors.white))),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color: Colors.black,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal,
                    ),
                    child: Center(child: Text("Set Destination", style: AppTextStyles.miniStyle.copyWith(fontSize: 16.sp, color: Colors.white))),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                        topLeft: Radius.circular(35),
                        bottomLeft: Radius.circular(35),
                      ),
                      border: Border.all(color: Colors.teal.shade300, width: 2.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(35), color: Colors.teal),
                          child: Icon(
                            [Icons.water_drop, Icons.terrain, Icons.forest, Icons.table_bar, Icons.water][index],
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            ["Lakes", "Mountains", "Forest", "Hotels", "Rivers"][index],
                            style: AppTextStyles.smallStyle,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                    SizedBox(
                      height: 270,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              index == 0 ? const SizedBox(width: 8) : const SizedBox(),
                              Container(
                                width: 170,
                                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                                    Container(
                                      margin: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: const PreviewCardImage(
                                          height: 110,
                                          width: 170,
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
                                                    style:
                                                        AppTextStyles.smallStyle.copyWith(color: AppColors.darkYellow, fontWeight: FontWeight.bold),
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
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "See All",
                          style: AppTextStyles.normalStyle.copyWith(fontWeight: FontWeight.w600, color: Colors.teal),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
