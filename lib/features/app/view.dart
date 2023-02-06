import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/constants/iconfont.dart';

import '../community/view.dart';
import '../home/view.dart';
import '../profile/view.dart';
import '../service_category/view.dart';
import 'controller.dart';

class AppPage extends GetView<AppController> {
  const AppPage({super.key});

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children: const [
        HomePage(),
        ServiceCategoriesPage(),
        CommunityPage('社区'),
        ProfilePage(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.pageIndex.value,
        onTap: controller.handleNavBarTap,
        backgroundColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 22,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconFont.home),
            label: '主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconFont.service),
            label: '服务',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconFont.community),
            label: '社区',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconFont.mine),
            label: '我的',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
