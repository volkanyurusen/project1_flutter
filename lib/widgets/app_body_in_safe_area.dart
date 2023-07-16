import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class AppBodyInSafeArea extends StatelessWidget {
  final Widget child;

  const AppBodyInSafeArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppBody(child: child);
  }
}
