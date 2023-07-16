import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

import '../../../widgets/widget.dart';

class SkeltonOfTraining extends StatelessWidget {
  const SkeltonOfTraining({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = context.height;
    final double width = context.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomAppSizedBox(),
        SkeltonContainer(height: height * 0.25, width: width),
        const CustomAppSizedBox(height: 9),
        SkeltonContainer(height: 18, width: 120),
        const CustomAppSizedBox(height: 5),
        SkeltonContainer(height: 18, width: 90),
        const CustomAppSizedBox(),
      ],
    );
  }
}
