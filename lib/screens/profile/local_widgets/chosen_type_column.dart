import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTypeColumn extends StatelessWidget {
  final List<Widget> children;
  final double screenWidth;
  final Color color;

  const ChosenTypeColumn({
    required this.children,
    required this.screenWidth,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
            ),
            width: screenWidth,
            child: AppBody(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: children),
            ),
          ),
        ),
      ],
    );
  }
}
