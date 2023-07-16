import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final String asset;
  const CustomImageContainer({
    this.height,
    this.width,
    required this.asset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 106,
      width: width ?? 106,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(asset)),
      ),
    );
  }
}
