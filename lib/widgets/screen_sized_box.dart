import 'package:flutter/material.dart';

class ScreenSizedBox extends StatelessWidget {
  final Widget child;
  final double? heightRadio;
  final double? widthRadio;

  const ScreenSizedBox({
    Key? key,
    required this.child,
    this.heightRadio = 1,
    this.widthRadio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightRadio!,
      width: MediaQuery.of(context).size.width * widthRadio!,
      child: child,
    );
  }
}
