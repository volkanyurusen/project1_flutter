import 'package:flutter/material.dart';

class TypeCardContentArea extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;

  const TypeCardContentArea({
    required this.mainAxisAlignment,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            child: Column(
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    )));
  }
}
