import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class SkeltonWrap extends StatelessWidget {
  final double screenWidth;
  final int numberOfWidget;
  const SkeltonWrap({
    required this.screenWidth,
    required this.numberOfWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 10, spacing: 10, children: [
      for (int i = 0; i < numberOfWidget; i++)
        SkeltonContainer(height: 36, width: screenWidth * 0.35)
    ]);
  }
}
