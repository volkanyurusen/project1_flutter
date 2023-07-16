import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

import 'bodies/zbodies.dart';
import 'local_widgets/zlocal_widget.dart';

class ScreenOfPaymentDetails extends StatelessWidget {
  static const String routeName = 'screen_of_payment_details';
  final AppColors _appColors = AppColors();

  ScreenOfPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Color lightTextColor = _appColors.textColor.withOpacity(0.75);

    return Scaffold(
        appBar: _createAppBar(lightTextColor),
        body: const PaymentDetailsBody());
  }

  /// CREATE ===========================================================================================================
  ProfilePageAppBar _createAppBar(Color lightTextColor) => ProfilePageAppBar(
      titleText: 'Payment Details',
      icon: IconButton(
        icon: Icon(Icons.add, color: lightTextColor),
        splashRadius: 20,
        onPressed: () {
          if (kDebugMode) {
            print('Add new payment type has been clicked!!!');
          }
        },
      ));
}
