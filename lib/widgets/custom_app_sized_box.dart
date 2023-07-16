import 'package:flutter/material.dart';

class CustomAppSizedBox extends StatelessWidget {
  final double height;
  final double? width;
  const CustomAppSizedBox({
    this.height = 18,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
