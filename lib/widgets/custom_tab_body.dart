import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class CustomTabBody extends StatelessWidget {
  final List<Widget> children;

  const CustomTabBody({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBody(child: CustomColumn(children: children));
  }
}