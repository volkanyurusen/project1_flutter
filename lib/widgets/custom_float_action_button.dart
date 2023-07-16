import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomFloatActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final AppColors _appColors = AppColors();
  CustomFloatActionButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8.0,
      right: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: ShapeDecoration(
              shape: const CircleBorder(), color: _appColors.primary),
          child: IconButton(
              icon: const Icon(Icons.add),
              color: _appColors.backgroundColor,
              onPressed: onPressed),
        ),
      ),
    );
  }
}
