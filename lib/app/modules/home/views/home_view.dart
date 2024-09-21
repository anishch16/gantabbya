import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gantabbya/app/data/remote/api_urls.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../utils/greetings.dart';
import '../../../utils/preview_image_card.dart';
import '../controllers/home_controller.dart';
import '../widgets/image_switcher.dart';

class HomeView extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());
  var pageCounter = 0.obs;
  final localData = GetStorage();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("${getGreetingMessage()}, Anish", style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18.sp, color: Colors.black))),
                  const SizedBox(width: 8),
                  Icon(
                    getGreetingIcon(),
                    size: 16,
                    color: getGreetingColor(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSwitcher(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Let's\nTravel\nThe World",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ))),
                    SizedBox(
                      width: 40.w,
                      child: Text(
                        "The beauty of new destinations awaits!",
                        style: AppTextStyles.miniStyle.copyWith(fontSize: 16.sp, color: Colors.grey),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                // const Row(
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         PreviewCardImage(
                //           height: 60,
                //           width: 80,
                //           url: ApiUrls.dummyDestinationImage,
                //           errorImage: const AssetImage(ApiUrls.dummyImage),
                //         ),
                //         SizedBox(
                //           height: 8.0,
                //         ),
                //         PreviewCardImage(
                //           height: 60,
                //           width: 80,
                //           url: ApiUrls.dummyDestinationImage,
                //           errorImage: const AssetImage(ApiUrls.dummyImage),
                //         ),
                //       ],
                //     ),
                //     SizedBox(
                //       width: 8.0,
                //     ),
                //     Column(
                //       children: [
                //         PreviewCardImage(
                //           height: 100,
                //           width: 100,
                //           url: ApiUrls.dummyDestinationImage,
                //           errorImage: const AssetImage(ApiUrls.dummyImage),
                //         ),
                //       ],
                //     ),
                //   ],
                // )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.cyan.withOpacity(0.15),
                  //     offset: const Offset(0, -4),
                  //     blurRadius: 6,
                  //     spreadRadius: 2,
                  //   ),
                  // ],
                  // color: Colors.white,
                  // borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                ),
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
                      height: 190,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: const PreviewCardImage(
                                    height: 185,
                                    width: 300,
                                    url: ApiUrls.dummyDestinationImage,
                                    // radius: 16,
                                    errorImage: AssetImage(
                                      ApiUrls.dummyDestinationImage,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    width: 150,
                                    height: 185,
                                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Pashupatinath",
                                          style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          "Kathmandu, Nepal",
                                          style: AppTextStyles.miniStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 4.0),
                                        Wrap(
                                          spacing: 0,
                                          runSpacing: 0,
                                          children: [
                                            Text(
                                              '\u2022 Sacred Temple',
                                              style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '\u2022 Spiritual place',
                                              style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '\u2022 Cultural Heritage',
                                              style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '\u2022 Religious',
                                              style: AppTextStyles.miniStyle.copyWith(fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8.0),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.flight,
                                              color: AppColors.black,
                                              size: 20,
                                            ),
                                            SizedBox(width: 4),
                                            Icon(
                                              Icons.directions_bus,
                                              color: AppColors.black,
                                              size: 20,
                                            ),
                                            SizedBox(width: 4),
                                            Icon(
                                              Icons.pedal_bike_rounded,
                                              color: AppColors.black,
                                              size: 20,
                                            ),
                                            SizedBox(width: 4),
                                            Icon(
                                              Icons.directions_train_rounded,
                                              color: AppColors.grey,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Hotels",
                            style: AppTextStyles.normalStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 190,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: const PreviewCardImage(
                                    height: 185,
                                    width: 300,
                                    url: ApiUrls.dummyHotelImage,
                                    // radius: 16,
                                    errorImage: AssetImage(
                                      ApiUrls.dummyImage,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    width: 150,
                                    height: 185,
                                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hotel Siddartha",
                                          style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
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
                                            const Icon(
                                              Icons.star_rounded,
                                              color: AppColors.darkYellow,
                                              size: 16,
                                            ),
                                            const Icon(
                                              Icons.star_rounded,
                                              color: AppColors.darkYellow,
                                              size: 16,
                                            ),
                                            const Icon(
                                              Icons.star_rounded,
                                              color: AppColors.darkYellow,
                                              size: 16,
                                            ),
                                            const Icon(
                                              Icons.star_rounded,
                                              color: AppColors.darkYellow,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          "Kathmandu, Nepal",
                                          style: AppTextStyles.miniStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          "\$500.00",
                                          style: AppTextStyles.miniStyle.copyWith(
                                            color: Colors.red,
                                            decoration: TextDecoration.lineThrough,
                                            decorationColor: Colors.red,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "\$400.00",
                                          style: AppTextStyles.miniStyle.copyWith(color: Colors.green, fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 8.0),
                                        Wrap(
                                          spacing: 4.0,
                                          runSpacing: 4.0,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0), color: AppColors.lightYellow),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                                                child: Text("Pool",
                                                    style: AppTextStyles.miniStyle.copyWith(color: AppColors.black), textAlign: TextAlign.center),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0), color: AppColors.lightYellow),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                                                child: Text("Safari",
                                                    style: AppTextStyles.miniStyle.copyWith(color: AppColors.black), textAlign: TextAlign.center),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0), color: AppColors.lightYellow),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                                                child: Text("Snooker",
                                                    style: AppTextStyles.miniStyle.copyWith(color: AppColors.black), textAlign: TextAlign.center),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0), color: AppColors.lightYellow),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                                                child: Text("Spa",
                                                    style: AppTextStyles.miniStyle.copyWith(color: AppColors.black), textAlign: TextAlign.center),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // Obx(() => profileController.isProfileDataLoading.value
    //         ? const HomeShimmer()
    //         :
    // SingleChildScrollView(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(
    //                       right: 16.0, left: 16.0, top: 16),
    //                   child: GestureDetector(
    //                     onTap: () {
    //                       // Get.to(() => CalendarView());
    //                     },
    //                     child: Material(
    //                       elevation: 0.5,
    //                       color: AppColors.white,
    //                       borderRadius: BorderRadius.circular(20),
    //                       child: Container(
    //                         padding: const EdgeInsets.all(16.0),
    //                         child: Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Text("$dayOfWeek,",
    //                                 style: normalStyle.copyWith(
    //                                     fontWeight: FontWeight.bold,
    //                                     color: AppColors.appGrey)),
    //                             Text(" $monthName ",
    //                                 style: normalStyle.copyWith(
    //                                     fontWeight: FontWeight.bold,
    //                                     color: AppColors.primary)),
    //                             Text(
    //                               "$day, ",
    //                               style: normalStyle.copyWith(
    //                                   fontWeight: FontWeight.bold,
    //                                   color: AppColors.primary),
    //                             ),
    //                             Text(year,
    //                                 style: normalStyle.copyWith(
    //                                     fontWeight: FontWeight.bold,
    //                                     color: AppColors.primary)),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   padding: const EdgeInsets.all(16.0),
    //                   child: GridView.builder(
    //                     physics: const NeverScrollableScrollPhysics(),
    //                     shrinkWrap: true,
    //                     // itemCount: profileController.isStaff
    //                     //     ? controller.homeListAll.length
    //                     //     : controller.homeListNormalUser.length,
    //                     gridDelegate:
    //                         const SliverGridDelegateWithMaxCrossAxisExtent(
    //                             maxCrossAxisExtent: 200,
    //                             mainAxisSpacing: 10,
    //                             childAspectRatio: 1.2,
    //                             crossAxisSpacing: 10),
    //                     itemBuilder: (BuildContext context, index) =>
    //                         GestureDetector(
    //                             onTap: () {
    //                               // profileController.isStaff
    //                               //     ? navigationAll(index)
    //                               //     : navigationFiltered(index);
    //                             },
    //                             child: HomeCardView(
    //                                 icon:
    //                                 // profileController.isStaff
    //                                 //     ? controller.homeCardIcons[index]
    //                                 //     :
    //                                 controller
    //                                         .homeCardIconsNormalUser[index],
    //                                 title:
    //                                 // profileController.isStaff
    //                                 //     ? controller.homeListAll[index]
    //                                 //     :
    //                                 controller
    //                                         .homeListNormalUser[index])),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           )
    //
    // Container(
    //         padding: EdgeInsets.symmetric(horizontal: 16.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             SizedBox(height: 16.0),
    //             SizedBox(
    //               height: 32,
    //               child: ListView.builder(
    //                 shrinkWrap: true,
    //                 scrollDirection: Axis.horizontal,
    //                 itemCount: profileController.isStaff
    //                     ? homeListAll.length
    //                     : homeListFiltered.length,
    //                 itemBuilder: (BuildContext context, index) => Padding(
    //                   padding: const EdgeInsets.only(right: 8.0),
    //                   child: GestureDetector(
    //                       onTap: () {
    //                         pageCounter.value = index;
    //                       },
    //                       child: TabContainer(
    //                           isClicked: pageCounter.value == index
    //                               ? true
    //                               : false,
    //                           title: profileController.isStaff
    //                               ? homeListAll[index]
    //                               : homeListFiltered[index])),
    //                 ),
    //               ),
    //             ),
    //             profileController.isStaff
    //                 ? changeViewAll()
    //                 : changeViewFiltered()
    //           ],
    //         ),
    //       ),
    // );
  }

  // navigationAll(int index) {
  //   // if (index == 0) {
  //   //   Get.to(() => MyHospitalView());
  //   // } else if (index == 1) {
  //   //   Get.to(() => HospitalsView());
  //   // } else if (index == 2) {
  //   //   Get.to(() => VitalsView());
  //   // } else if (index == 3) {
  //   //   Get.to(() => MedicationsView());
  //   // } else if (index == 4) {
  //   //   Get.to(() => InventoryView());
  //   // } else if (index == 5) {
  //   //   Get.to(() => AddPartnerView());
  //   // } else if (index == 6) {
  //   //   Get.to(() => ServicesView());
  //   // }
  // }

  navigationFiltered(int index) {
    // if (index == 0) {
    //   Get.to(() => HospitalsView());
    // } else if (index == 1) {
    //   Get.to(() => VitalsView());
    // } else if (index == 2) {
    //   Get.to(() => MedicationsView());
    // } else if (index == 3) {
    //   Get.to(() => InventoryView());
    // } else if (index == 4) {
    //   Get.to(() => AddPartnerView());
    // } else if (index == 5) {
    //   Get.to(() => ServicesView());
    // }
  }
}
