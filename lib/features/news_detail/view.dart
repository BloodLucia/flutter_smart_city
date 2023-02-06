import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/extensions/extensions.dart';
import '../../core/models/news.dart';
import '../../core/utils/filter_news_content.dart';
import '../../core/utils/handle_error_image.dart';
import 'controller.dart';

class NewsDetailPage extends GetView<NewsDetailController> {
  const NewsDetailPage({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('新闻详情')),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            /// 新闻标题
            Container(
              padding: context.paddingNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title!,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  context.emptySizedHeightBoxLow,
                  Text(
                    '发布时间: ${news.publishDate!}',
                    style: context.textTheme.labelMedium!
                        .copyWith(color: context.grey),
                  ),
                ],
              ),
            ),

            /// 发布时间
            SizedBox(
              height: 200,
              width: double.infinity,
              child: handleErrorImage(news.cover!),
            ),
            Container(
              padding: context.paddingNormal,
              child: Text(
                filterNewsContent(news.content!),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.5,
                    ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.primaryColor,
        onPressed: () {
          Get.defaultDialog(
            titlePadding: context.paddingLow,
            contentPadding: context.paddingLow,
            title: '评论',
            textConfirm: '提交',
            confirmTextColor: Colors.white,
            buttonColor: context.primaryColor,
            content: TextFormField(
              decoration: const InputDecoration(
                helperText: '请文明发言~',
                // border: InputBorder.none,
              ),
            ),
          );
        },
        child: const Icon(Icons.comment, color: Colors.white),
      ),
    );
  }
}
