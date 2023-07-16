import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class UserTypeDetailsBody extends StatelessWidget {
  const UserTypeDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleLarge = Theme.of(context).textTheme.titleLarge!;

    return CustomAppBody(
      children: [
        CustomColumn(children: [
          const CustomAppSizedBox(),
          UserTypeDetailsTypeNamelAndChangeButtonArea(titleLarge: titleLarge),
          const CustomAppSizedBox(),
        ]),
        UserTypeDetailTypeContentArea(titleLarge: titleLarge),
        const CustomAppSizedBox(),
      ],
    );
  }
}
