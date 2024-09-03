import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  //TODO: Implement BottomNavController
  var pageIndex = 0.obs;
  final count = 0.obs;
  var currentIndex = 0.obs;
  PageController pageController = PageController();
  // void changePage(int index) {
  //   currentIndex.value = index; // Update observable
  //   pageController.jumpToPage(index);
  // }
  var selectedTab = _SelectedTab.home.obs;
  // late PageController pageController;

  int get selectedTabIndex => _SelectedTab.values.indexOf(selectedTab.value);

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedTabIndex);
    super.onInit();
  }

  void changePage(int index) {
    selectedTab.value = _SelectedTab.values[index];
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
  void increment() => count.value++;
}
enum _SelectedTab { home, favorite, search, person }
