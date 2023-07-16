import 'package:flutter/material.dart';
import 'package:my_project/constants/app_colors.dart';

class UserImageContainer extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final String url;
  final double? height;
  final double? width;
  final bool isResponded;

  UserImageContainer({
    required this.url,
    this.height,
    this.width,
    this.isResponded = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 106,
        width: width ?? 106,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: isResponded ? 3.0 : 1.0,
              color: isResponded
                  ? _appColors.secondary
                  : _appColors.unselectedContainerColor),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(url),
          ),
        ));
  }
}
