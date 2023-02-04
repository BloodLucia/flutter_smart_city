import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/loader.dart';
import '../../../../core/extensions/extensions.dart';
import '../../core/widgets/primary_app_bar.dart';
import 'controller.dart';
import 'widgets/filter_news_list.dart';
import 'widgets/head_swiper.dart';
import 'widgets/news_item_selector.dart';
import 'widgets/service_categories.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: '主页', context: context),
      backgroundColor: context.groupedBackground,
      body: Obx(
        () => controller.isLoading
            ? const MyLoader()
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  /// 顶部轮播图
                  SliverToBoxAdapter(
                      child: HeadSwiper(resources: controller.rotationList)),

                  // / 服务分类
                  SliverToBoxAdapter(
                    child: ServiceCategories(resources: controller.serviceList),
                  ),

                  /// 服务分类
                  SliverToBoxAdapter(
                    child: _buildNewsHeader(context),
                  ),

                  /// 新闻分类
                  SliverToBoxAdapter(
                      child: NewsItemSelector(
                          categories: controller.newsCategories)),

                  /// 新闻列表
                  FilterNewsList(resources: controller.filteredNewsList),
                ],
              ),
      ),
    );
  }

  Widget _buildNewsHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: context.normalValue, bottom: context.normalValue),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text('新闻专栏', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}
