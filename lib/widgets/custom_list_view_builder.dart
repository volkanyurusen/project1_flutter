import 'package:flutter/material.dart';

class CustomListViewBuilder extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Axis? scrollDirection;
  final bool? reverse;
  final ScrollController? controller;

  const CustomListViewBuilder({
    required this.itemCount,
    required this.itemBuilder,
    this.scrollDirection,
    this.reverse,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      controller: controller,
      scrollDirection: scrollDirection ?? Axis.vertical,
      reverse: reverse ?? false,
    );
  }
}
