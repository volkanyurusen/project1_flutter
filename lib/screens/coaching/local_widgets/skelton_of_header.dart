import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class SkeltonOfHeader extends StatelessWidget {
  const SkeltonOfHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    // double screenWidth = MediaQuery.of(context).size.width;
    final double screenWidth = context.width;

    return SkeltonContainer(height: 24, width: screenWidth * 0.35);
  }
}
