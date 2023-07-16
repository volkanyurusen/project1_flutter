import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';

import 'bodies/zbodies.dart';
import 'pop_ups/zpop_ups.dart';

class ScreenOfPersonalDetails extends StatelessWidget {
  static const String routeName = 'screen_of_personal_details';
  final AppColors _appColors = AppColors();

  ScreenOfPersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    UserDynamicBloc userDynamicBloc = context.read<UserDynamicBloc>();
    Color lightTextColor = _appColors.dividerColor.withOpacity(0.75);

    return Scaffold(
        appBar:
            _createAppBar(context, userBloc, userDynamicBloc, lightTextColor),
        body: PersonalDetailsBody(
            userBloc: userBloc, userDynamicBloc: userDynamicBloc));
  }

  /// CREATE ===========================================================================================================
  ProfilePageAppBar _createAppBar(
    BuildContext context,
    UserBloc userBloc,
    UserDynamicBloc userDynamicBloc,
    Color lightTextColor,
  ) =>
      ProfilePageAppBar(
        titleText: 'Personal Details',
        icon: IconButton(
            icon: Icon(Icons.edit, color: lightTextColor),
            splashRadius: 20,
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => PersonalDetailsEditingPopUp(
                      userBloc: userBloc, userDynamicBloc: userDynamicBloc));
            }),
      );
}
