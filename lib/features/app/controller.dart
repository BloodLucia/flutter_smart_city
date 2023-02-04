import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final pageIndex = 0.obs;

  final PageController pageController = PageController();

  void handleNavBarTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void handlePageChanged(int index) {
    pageIndex.value = index;
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
