import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';


class CardImageBox extends StatelessWidget {
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final AppNumberConstants _appNumberContants = AppNumberConstants();

  final String heroTag;
  final double? height;
  final String imageAddress;

  CardImageBox({
    required this.imageAddress,
    required this.heroTag,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? _appNumberContants.cardInformationHeight,
      child: Hero(
        tag: heroTag,
        child: ClipRRect(
          borderRadius: _appVisualConstants.borderRadiusCircularLeft,
          //
          // BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   bottomLeft: Radius.circular(20),
          // ),
          child: Image.network(imageAddress),
        ),
      ),
    );
  }
}
