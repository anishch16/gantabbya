import 'package:flutter/material.dart';
import 'package:gantabbya/app/constants/styles.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/colors.dart';
import '../../../data/remote/api_urls.dart';
import '../../../utils/preview_image_card.dart';
import '../controllers/favorite_trips_controller.dart';

class FavoriteTripsView extends GetView<FavoriteTripsController> {
  const FavoriteTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                  bottom: false,
                  child: Text("Favorite Trips", style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 18.sp, color: Colors.black)))),
              Container(
                decoration: BoxDecoration(
                  color: Colors.cyan.shade50.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(bottom: 8.0),
                height: 40,
                child: TabBar(
                  padding: EdgeInsets.zero,
                  // tabAlignment: TabAlignment.start,
                  // isScrollable: true,
                  labelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  splashBorderRadius: BorderRadius.circular(20),
                  // indicatorPadding: const EdgeInsets.symmetric(horizontal: 16),
                  indicator: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // labelColor: Colors.black,
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Favourites",
                    ),
                    Tab(
                      text: "Unlisted",
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(children: [
                  FavouriteTripList(),
                  FavouriteTripList(),
                  FavouriteTripList(),

                ]),
              )
            ],
          ),
        ));
  }
}

class FavouriteTripList extends StatelessWidget {
  const FavouriteTripList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.white),
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    const PreviewCardImage(
                      radius: 12,
                      height: 350,
                      width: double.infinity,
                      url: ApiUrls.dummyDestinationImage,
                      errorImage: AssetImage(
                        ApiUrls.dummyDestinationImage,
                      ),
                    ),
                    Container(
                      height: 350,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColors.white.withOpacity(0.7)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Pashupatinath Temple", style: AppTextStyles.smallStyle),
                                      Text(
                                        "Kathmandu Nepal",
                                        style: AppTextStyles.miniStyle,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                    child: const Center(
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: AppColors.white.withOpacity(0.7)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Start date: 12-12-2022", style: AppTextStyles.smallStyle),
                                      Text("End date: 12-12-2022", style: AppTextStyles.smallStyle),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                                    child: Text(
                                      "\$550.00",
                                      style: AppTextStyles.smallStyle,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: index == 9 ? 100 : 24)
            ],
          );
        });
  }
}

class MyTabTwo extends StatelessWidget {
  const MyTabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          // SwitcherButton(
          //   value: true,
          //   onChange: (value) {
          //     print(value);
          //   },
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                labelColor: Colors.black,
                dividerColor: Colors.black,
                tabs: [
                  const Tab(
                    text: "Live",
                  ),
                  const Tab(
                    text: "Result",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(children: [
              // MyLivePage(),
              // MyResultPage(),
            ]),
          ),
        ],
      ),
    );
    //   Scaffold(
    //   body: Container(
    //     decoration: BoxDecoration(
    //       color: Colors.cyan.shade50.withOpacity(0.5),
    //     ),
    //     child: Column(
    //       children: [
    //         // Container(
    //         //   alignment: Alignment.center,
    //         //   padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
    //         //   decoration: const BoxDecoration(
    //         //     color: Colors.transparent,
    //         //     borderRadius: BorderRadius.only(
    //         //         bottomRight: Radius.circular(20),
    //         //         bottomLeft: Radius.circular(20)),
    //         //   ),
    //         //   child: Row(
    //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         //     children: [
    //         //       SizedBox(
    //         //           height: 40,
    //         //           width: 40,
    //         //           child: Image.asset(AppImages.logoPng)),
    //         //       IconButton(
    //         //         onPressed: () {},
    //         //         icon: const Icon(Icons.menu),
    //         //       )
    //         //     ],
    //         //   ),
    //         // ),
    //         Expanded(
    //           child: ListView.separated(
    //             scrollDirection: Axis.vertical,
    //             shrinkWrap: true,
    //             itemCount: 10,
    //             padding: EdgeInsets.zero,
    //             itemBuilder: (BuildContext context, int index) {
    //               return Container(
    //                 padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
    //                 margin: const EdgeInsets.symmetric(horizontal: 16),
    //                 decoration: BoxDecoration(
    //                   color: AppColors.white,
    //                   borderRadius: BorderRadius.circular(20)
    //                 ),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     const Row(
    //                       children: [
    //                         PreviewCardImage(
    //                           height: 80,
    //                           width: 100,
    //                           url:
    //                               'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    //                           radius: 16,
    //                           errorImage: AssetImage(
    //                             'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    //                           ),
    //                         ),
    //                         SizedBox(width: 16),
    //                         Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               'Pokhara',
    //                               style: TextStyle(fontSize: 20),
    //                             ),
    //                             Text(
    //                               'Kathmandu',
    //                               style: TextStyle(fontSize: 20),
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //
    //                     IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: AppColors.red,)),
    //                   ],
    //                 ),
    //               );
    //             },
    //             separatorBuilder: (BuildContext context, int index) {
    //               return const SizedBox(height: 16);
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
