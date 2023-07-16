import 'package:flutter/material.dart';

class AppListViewBuilder extends StatelessWidget {
  final ScrollPhysics? physics;
  final int itemCount;
  final bool shrinkWrap;
  final IndexedWidgetBuilder itemBuilder;

  const AppListViewBuilder({
    required this.itemCount,
    required this.itemBuilder,
    this.physics,
    this.shrinkWrap = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: physics ?? const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemCount, // state.recentActivityList.length,
        shrinkWrap: shrinkWrap,
        itemBuilder: itemBuilder);
  }
}
