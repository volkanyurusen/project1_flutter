import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  final Widget child;

  const PopUpDialog({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10.0),
      child: child,
    );
  }
}
