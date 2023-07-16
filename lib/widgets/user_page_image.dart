import 'package:flutter/material.dart';

import '../constants/constants.dart';

class UserPageImage extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final String url;

  UserPageImage({
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: _appColors.unselectedContainerColor),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(url),
          ),
        ));
  }
}
