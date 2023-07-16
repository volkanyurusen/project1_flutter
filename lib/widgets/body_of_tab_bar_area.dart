import 'package:flutter/material.dart';

class BodyOfTabBar extends StatelessWidget {
  final Widget child;

  const BodyOfTabBar({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(height: double.maxFinite, child: child),
    );
  }
}
