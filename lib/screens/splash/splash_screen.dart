import 'package:flutter/material.dart';

class ScreenOfSplash extends StatelessWidget {
  static const String routeName = 'screen_of_splash';

  const ScreenOfSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color backgroundColor =
    //     Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0);

    return Container();
    // return Stack(
    //   children: [
    //     _createScreenSizedBox(backgroundColor),
    //   ],
    // );
  }

  // /// CREATE ==========================================================================================================
  // ScreenSizedBox _createScreenSizedBox(
  //   Color backgroundColor,
  // ) =>
  //     ScreenSizedBox(
  //       child: _displayScreenStack(backgroundColor),
  //     );

  // /// DISPLAY ==========================================================================================================
  // CustomScreenStack _displayScreenStack(
  //   Color backgroundColor,
  // ) =>
  //     CustomScreenStack(
  //       assetImage: _assetImage,
  //       imageFilterBlurSigmaX: 1.8,
  //       imageFilterBlurSigmaY: 1.8,
  //       color: backgroundColor,
  //     );

  // /// METHODS ==========================================================================================================
  // String get _assetImage =>
  //     'assets/images/home_screens/home-screen-${Random().nextInt(10)}.jpg';
}
