import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class SkeltonColumn extends StatelessWidget {
  final double screenWidth;

  const SkeltonColumn({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SkeltonContainer(height: 18, width: screenWidth * 0.25),
            SkeltonContainer(height: 18, width: screenWidth * 0.30),
          ],
        ),
      ],
    );
  }
}
