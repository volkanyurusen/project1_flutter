import 'package:flutter/material.dart';

class HorizontalScrollBox extends StatelessWidget {
  final double? height;
  final Widget child;
  const HorizontalScrollBox({
    this.height,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.maxFinite,
      child: child,
    );
  }
}
