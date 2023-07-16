import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingTypeDetailsBody extends StatelessWidget {
  const CoachingTypeDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleLarge = Theme.of(context).textTheme.titleLarge!;

    return CustomAppBody(
      children: [
        CustomColumn(children: [
          const CustomAppSizedBox(),
          CoachingTypeDetailsTypeNamelAndChangeButtonArea(
              titleLarge: titleLarge),
          const CustomAppSizedBox(),
        ]),
        CoachingTypeDetailTypeContentArea(titleLarge: titleLarge),
        const CustomAppSizedBox(),
      ],
    );
  }
}
