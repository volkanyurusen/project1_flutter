import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class CustomAppScrollView extends StatelessWidget {
  final Widget? child;
  const CustomAppScrollView({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          const CustomAppSizedBox(),
          Expanded(
            child: SingleChildScrollView(child: child),
          )
        ],
      ),
    );
  }
}
