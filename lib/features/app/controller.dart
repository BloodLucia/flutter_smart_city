import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final pageIndex = 0.obs;

  late PageController pageController;

  void handleNavBarTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void handlePageChanged(int index) {
    pageIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
