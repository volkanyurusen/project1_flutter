import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';
import 'bodies/zbodies.dart';

class ScreenOfUserTypeDetails extends StatelessWidget {
  static const String routeName = 'screen_of_user_type_details';

  const ScreenOfUserTypeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfilePageAppBar(titleText: 'User Type Details'),
      body: const UserTypeDetailsBody(),
    );
  }
}
