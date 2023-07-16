import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class LocationDetailsBody extends StatelessWidget {
  const LocationDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBody(
      children: [
        LocationDetailsLocationTemplateNamelAndChangeButtonArea(),
        LocationDetailBodyLocationDetailArea(),
      ],
    );
  }
}
