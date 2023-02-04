import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/models/service.dart';
import '../../../core/widgets/special_image.dart';
import '../../service_category/view.dart';

class ServiceCategories extends StatelessWidget {
  const ServiceCategories({super.key, required this.resources});

  final List<ServiceItem> resources;

  Widget _buildItem(BuildContext context, ServiceItem item, int index) {
    return InkWell(
      onTap: () {
        if (index == 7) {
          Get.to(() => const ServiceCategoriesPage());
        } else {
          Get.toNamed(item.link!);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: SpecialImage(
                url: index == 7
                    ? 'https://i.328888.xyz/2023/02/04/NRnak.png'
                    : item.imgUrl!),
          ),
          Text(index == 7 ? '更多服务' : item.serviceName!),
        ],
      ),
    );
  }

  void toServiceModule(String module) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      alignment: Alignment.center,
      width: Get.mediaQuery.size.width,
      margin: EdgeInsets.only(
        left: context.lowValue,
        right: context.lowValue,
        bottom: context.normalValue,
      ),
      constraints: const BoxConstraints(minHeight: 150),
      decoration: BoxDecoration(
        borderRadius: context.lowBorderRadius,
        color: Colors.white,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return _buildItem(context, resources[index], index);
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      ),
    );
  }
}
