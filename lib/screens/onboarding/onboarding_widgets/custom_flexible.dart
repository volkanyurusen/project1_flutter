import 'package:flutter/material.dart';

class CustomFlexible extends StatelessWidget {
  final int flex;
  final double aspectRatio;
  const CustomFlexible({
    Key? key,
    required this.flex,
    required this.aspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * aspectRatio,
      ),
    );
  }
}
