import 'dart:ui';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.assetImage,
    required this.imageFilterBlurSigmaX,
    required this.imageFilterBlurSigmaY,
    required this.color,
  }) : super(key: key);

  final String assetImage;
  final double imageFilterBlurSigmaX;
  final double imageFilterBlurSigmaY;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            assetImage,
          ),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: imageFilterBlurSigmaX,
          sigmaY: imageFilterBlurSigmaY,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
        ),
      ),
    );
  }
}
