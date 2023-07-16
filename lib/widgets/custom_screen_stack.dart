import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class CustomScreenStack extends StatelessWidget {
  final String assetImage;
  final double imageFilterBlurSigmaX;
  final double imageFilterBlurSigmaY;
  final Color color;

  const CustomScreenStack({
    Key? key,
    required this.assetImage,
    required this.imageFilterBlurSigmaX,
    required this.imageFilterBlurSigmaY,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ImageContainer(
            assetImage: assetImage,
            imageFilterBlurSigmaX: imageFilterBlurSigmaX,
            imageFilterBlurSigmaY: imageFilterBlurSigmaY,
            color: color),
      ],
    );
  }
}
