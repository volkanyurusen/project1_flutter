import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  final Widget child;
  final AlignmentGeometry? alignment;

  const AppBody({
    Key? key,
    required this.child,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0),
      alignment: alignment ?? Alignment.topLeft,
      child: child,
    );
  }
}
