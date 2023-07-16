import 'package:flutter/material.dart';

import 'bodies/zbodies.dart';

class TabOfFindACoach extends StatelessWidget {
  const TabOfFindACoach({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        FindACoachBody(),
      ],
    );
  }
}
