import 'package:flutter/material.dart';

class AppWrap extends StatelessWidget {
  final Axis? wrapDirection;
  final double? wrapSpacing;
  final double? wrapRunSpacing;
  final List<Widget> children;

  const AppWrap({
    required this.children,
    this.wrapDirection,
    this.wrapSpacing,
    this.wrapRunSpacing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: wrapDirection ?? Axis.horizontal,
      spacing: wrapSpacing ?? 5.0,
      runSpacing: wrapRunSpacing ?? 10.0,
      children: children,
    );
  }
}
