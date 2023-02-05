import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_getx/features/home/controller.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/models/news.dart';
import '../../news_detail/view.dart';

class FilterNewsList extends GetView<HomeController> {
  const FilterNewsList({super.key, required this.resources});

  final List<News> resources;

  _buildNewsItem(News news, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => NewsDetailPage(news: news));
      },
      child: Container(
        padding: context.paddingNormal,
        margin: EdgeInsets.only(
          left: context.lowValue,
          right: context.lowValue,
          bottom: context.normalValue,
        ),
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: context.lowBorderRadius,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title!,
                        style: const TextStyle(fontSize: 16),
                      ),
                      context.emptySizedHeightBoxLow,
                      Text(news.content!,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: context.grey)),
                    ],
                  ),
                ),
                context.emptySizedWidthBoxLow,
                SizedBox(
                  width: 118,
                  height: 132,
                  child: ClipRRect(
                    borderRadius: context.lowBorderRadius,
                    child: Image.asset(
                      'assets/images/iphone.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            context.emptySizedHeightBoxLow,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      size: 16,
                      color: context.grey,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      news.publishDate!,
                      style: TextStyle(
                        fontSize: 14,
                        color: context.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.comment,
                      color: context.grey,
                      size: 16,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '${news.commentNum!}条评论',
                      style: TextStyle(
                        color: context.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildNewsItem(resources[index], context),
          childCount: resources.length,
        ),
      ),
    );
  }
}
