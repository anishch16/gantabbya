import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/styles.dart';
import '../../../utils/preview_image_card.dart';
import '../controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());
  var pageCounter = 0.obs;
  final localData = GetStorage();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Colors.cyan.shade50.withOpacity(0.5),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(AppImages.logoPng)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: controller.carouselSliderController,
                    options: CarouselOptions(
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      height: 218,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        // context.read<PersonaCubit>().imageIndex(index);
                      },
                    ),
                    items: controller.images
                        .map((item) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Stack(
                                children: [
                                  PreviewCardImage(
                                    height: 218,
                                    width: double.infinity,
                                    url: item,
                                    radius: 16,
                                    errorImage: const AssetImage(
                                      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 8,
                                      left: 8,
                                      child: Text(
                                        "Test Text",
                                        style: mediumStyle.copyWith(
                                            color: AppColors.white),
                                      ))
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Destination",
                          style: normalStyle,
                        ),
                        Row(
                          children: [
                            Text(
                              "View More",
                              style:
                                  normalStyle.copyWith(color: AppColors.blue),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: AppColors.blue,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: Expanded(
                      child: ListView.separated(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 16);
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 16 : 0,
                                right: index == 9 ? 16 : 0),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PreviewCardImage(
                                  height: 218,
                                  width: 218,
                                  url:
                                      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                  radius: 16,
                                  errorImage: AssetImage(
                                    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.flag),
                                    Text("Nepal"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text("Kathmandu"),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Hotels",
                          style: normalStyle,
                        ),
                        Row(
                          children: [
                            Text(
                              "View More",
                              style:
                                  normalStyle.copyWith(color: AppColors.blue),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: AppColors.blue,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: Expanded(
                      child: ListView.separated(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 16);
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 16 : 0,
                                right: index == 9 ? 16 : 0),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PreviewCardImage(
                                  height: 218,
                                  width: 218,
                                  url:
                                      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                  radius: 16,
                                  errorImage: AssetImage(
                                    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.flag),
                                    Text("Pokhara"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text("Siddartha"),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 100)
                ],
              ),
            ),
          ),
        ],
      ),
    ));
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
