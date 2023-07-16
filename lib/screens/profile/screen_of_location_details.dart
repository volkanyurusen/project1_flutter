import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';
import 'bodies/zbodies.dart';

class ScreenOfLocationDetails extends StatelessWidget {
  static const String routeName = 'screen_of_location_details';

  const ScreenOfLocationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfilePageAppBar(titleText: 'Location Details'),
      body: const LocationDetailsBody(),
    );
  }
}
