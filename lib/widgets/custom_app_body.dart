import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class CustomAppBody extends StatelessWidget {
  final List<Widget> children;

  const CustomAppBody({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: SingleChildScrollView(
        child: CustomColumn(children: children),
      ),
    );
  }
}
