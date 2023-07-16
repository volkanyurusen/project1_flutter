import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class MessageContentAreaWithMessageTextFieldWithButton extends StatelessWidget {
  final List<Widget> children;

  const MessageContentAreaWithMessageTextFieldWithButton({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: CustomColumn(children: children));
  }
}
