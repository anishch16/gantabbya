import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../favorite_trips/views/favorite_trips_view.dart';
import '../../home/views/home_view.dart';
import '../../user_profile/views/user_profile_view.dart';
import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  BottomNavView({super.key});

  @override
  final controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.changePage(index);
        },
        children: <Widget>[
          HomeView(),
          const FavoriteTripsView(),
          const Center(child: Text("Plan the trip")),
          UserProfileView(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          onDestinationSelected: (index) => controller.changePage(index),
          indicatorColor: Colors.cyan.shade50,
          backgroundColor: Colors.white,
          selectedIndex: controller.selectedTabIndex,
          destinations:const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home,size: 24,),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite,size: 24),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon:  Icon(Icons.location_on,size: 24),
              label: 'Location',
            ),
            NavigationDestination(
              icon:  Icon(Icons.person,size: 24),
              label: 'Profile',
            ),
          ],
        ),
        //     DotNavigationBar(
        //   // margin: const EdgeInsets.only(left: 10, right: 10),
        //   // curve : Curves.easeIn,
        //   currentIndex: controller.selectedTabIndex,
        //   backgroundColor: AppColors.primary,
        //   dotIndicatorColor: AppColors.transparent,
        //   unselectedItemColor: AppColors.black,
        //   marginR: const EdgeInsets.only(left: 10, right: 10),
        //   // itemPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        //   // splashBorderRadius: 50,
        //   onTap: (index) => controller.changePage(index),
        //   items: [
        //     DotNavigationBarItem(
        //       icon: const Icon(Icons.home,size: 24,),
        //       selectedColor: AppColors.white,
        //     ),
        //     DotNavigationBarItem(
        //       icon: const Icon(Icons.favorite,size: 24),
        //       selectedColor: AppColors.white,
        //     ),
        //     DotNavigationBarItem(
        //       icon: const Icon(Icons.location_on,size: 24),
        //       selectedColor: AppColors.white,
        //     ),
        //     DotNavigationBarItem(
        //       icon: const Icon(Icons.person,size: 24),
        //       selectedColor:AppColors.white,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
