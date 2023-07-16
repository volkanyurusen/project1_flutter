import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class TemplateImageContainer extends StatelessWidget {
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final String asset;
  TemplateImageContainer({
    this.height,
    this.width,
    this.borderRadius,
    required this.asset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        borderRadius: _appVisualConstants.borderRadiusCircular,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            asset,
          ),
        ),
      ),
    );
  }
}
