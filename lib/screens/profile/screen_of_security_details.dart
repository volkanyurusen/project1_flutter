import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

import 'bodies/zbodies.dart';
import 'local_widgets/zlocal_widget.dart';

class ScreenOfSecurityDetails extends StatelessWidget {
  static const String routeName = 'screen_of_security_details';
  final AppColors _appColors = AppColors();

  ScreenOfSecurityDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Color lightTextColor = _appColors.textColor.withOpacity(0.75);

    return Scaffold(
        appBar: _createAppBar(lightTextColor),
        body: const PaymentDetailsBody());
  }

  /// CREATE ===========================================================================================================
  ProfilePageAppBar _createAppBar(Color lightTextColor) =>
      ProfilePageAppBar(titleText: 'Security Details');
}
