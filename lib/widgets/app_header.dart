import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final Color? color;
  final double? spaceFromUpperWidget;
  final Widget? firstWidget;
  final Widget? secondWidget;
  final Widget? thirdWidget;

  const AppHeader({
    this.color = Colors.transparent,
    this.firstWidget,
    this.spaceFromUpperWidget,
    this.secondWidget,
    this.thirdWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        children: [
          SizedBox(height: spaceFromUpperWidget),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              firstWidget ?? const SizedBox(),
              secondWidget ?? const SizedBox(),
              thirdWidget ?? const SizedBox(width: 0),
            ],
          ),
        ],
      ),
    );
  }
}
