import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_city_getx/core/extensions/extensions.dart';

class SpecialImage extends CachedNetworkImage {
  final String url;

  SpecialImage({Key? key, required this.url})
      : super(
          key: key,
          imageUrl: url,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(color: context.primaryColor),
          ),
          fit: BoxFit.cover,
        );
}
