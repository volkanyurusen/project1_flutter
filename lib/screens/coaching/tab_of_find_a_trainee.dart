import 'package:flutter/material.dart';

import 'bodies/zbodies.dart';

class TabOfFindATrainee extends StatelessWidget {
  const TabOfFindATrainee({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        FindATraineeBody(),
      ],
    );
  }
}
