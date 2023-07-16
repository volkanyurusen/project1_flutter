import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final MainAxisSize? mainAxisSize;
  final List<Widget> children;
  const CustomRow({
    this.mainAxisSize,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: mainAxisSize ?? MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
