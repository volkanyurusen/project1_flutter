import 'package:flutter/material.dart';
import 'package:my_project/constants/app_colors.dart';

class MessageImageContainer extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final ImageProvider<Object> imageWidget;
  final double? height;
  final double? width;
  final BoxShape? shape;

  MessageImageContainer({
    required this.imageWidget,
    this.height,
    this.width,
    this.shape,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 106,
        width: width ?? 106,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.circle,
          border: Border.all(color: _appColors.unselectedContainerColor),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: imageWidget,
          ),
        ));
  }
}
