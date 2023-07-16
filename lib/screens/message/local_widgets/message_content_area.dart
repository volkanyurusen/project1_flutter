import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class MessageContentArea extends StatelessWidget {
  final List<Widget> children;
  const MessageContentArea({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: CustomAppBody(children: children));
  }
}
