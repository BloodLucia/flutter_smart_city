import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    this.width = double.infinity,
    this.height = 125,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.borderRadius = 20,
    this.child,
  });

  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.only(
          bottomStart: Radius.circular(50),
          bottomEnd: Radius.circular(50),
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
