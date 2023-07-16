import 'package:flutter/material.dart';

class ColumnOfActivityAmountBox extends StatelessWidget {
  final List<Widget> children;
  const ColumnOfActivityAmountBox({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}
