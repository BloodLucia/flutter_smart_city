import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';
import 'package:smart_city_getx/core/widgets/special_image.dart';

import '../../../core/models/rotation.dart';

class HeadSwiper extends StatelessWidget {
  const HeadSwiper({
    super.key,
    required this.resources,
    this.onTap,
  });

  final List<Rotation> resources;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.normalValue),
      padding: EdgeInsets.only(
        top: context.normalValue,
        left: context.lowValue,
        right: context.lowValue,
      ),
      clipBehavior: Clip.hardEdge,
      width: context.width,
      height: 200,
      decoration: BoxDecoration(borderRadius: context.lowBorderRadius),
      child: Swiper(
        autoplay: true,
        autoplayDelay: 4000,
        duration: 700,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: ClipRRect(
              borderRadius: context.lowBorderRadius,
              child: SpecialImage(url: resources[index].advImg!),
            ),
          );
        },
        itemCount: resources.length,
      ),
    );
  }
}
