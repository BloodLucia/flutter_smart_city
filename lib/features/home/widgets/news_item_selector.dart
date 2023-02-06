import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';
import 'package:smart_city_getx/features/home/controller.dart';

import '../../../core/models/news_category.dart';

class NewsItemSelector extends GetView<HomeController> {
  const NewsItemSelector({super.key, required this.categories});

  final List<NewsCategory> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.lowValue),
      child: Container(
        height: 40,
        margin: EdgeInsets.only(bottom: context.normalValue),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Obx(
              () => AnimatedContainer(
                margin: const EdgeInsets.only(right: 10),
                duration: const Duration(milliseconds: 500),
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: controller.categoryIndex == index
                      ? context.primaryColor
                      : context.grey4.withOpacity(0.4),
                  borderRadius: context.normalBorderRadius,
                ),
                child: TextButton(
                  style:
                      const ButtonStyle(splashFactory: NoSplash.splashFactory),
                  onPressed: () {
                    controller.filterNewsByCategory(index);
                  },
                  child: Text(
                    categories[index].name!,
                    style: TextStyle(
                      color: controller.categoryIndex == index
                          ? Colors.white
                          : Colors.black,
                      fontWeight: controller.categoryIndex == index
                          ? FontWeight.bold
                          : null,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
