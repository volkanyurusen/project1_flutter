import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class ScrollableAppBody extends StatelessWidget {
  final Widget child;
  const ScrollableAppBody({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBody(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(child: child),
    );
  }
}
