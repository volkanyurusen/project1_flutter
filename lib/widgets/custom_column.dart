import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final List<Widget> children;

  const CustomColumn({
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: children,
    );
  }
}
