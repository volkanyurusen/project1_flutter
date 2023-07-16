import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/bodies/zbodies.dart';
import 'package:my_project/screens/profile/local_widgets/profie_page_app_bar.dart';

class ScreenOfUserTypes extends StatelessWidget {
  static const String routeName = 'screen_of_user_types';

  const ScreenOfUserTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ProfilePageAppBar(titleText: 'User Types'),
        body: const UserTypesBody());
  }
}
