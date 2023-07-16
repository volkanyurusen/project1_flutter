import 'package:flutter/material.dart';

import 'widget.dart';

class BasicScrollView extends StatelessWidget {
  final List<Widget> children;
  final ScrollController? controller;
  const BasicScrollView({
    required this.children,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: CustomColumn(children: children),
    );
  }
}
