import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBackDropFilter extends StatelessWidget {
  final Widget child;
  const CustomBackDropFilter({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: child,
    );
  }
}
