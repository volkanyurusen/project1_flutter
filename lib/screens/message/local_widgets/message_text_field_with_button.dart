import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

import 'zlocal_widget.dart';

class MessageTextFieldWithButton extends StatelessWidget {
  final VoidCallback sendMessageContent;

  const MessageTextFieldWithButton({
    required this.sendMessageContent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      children: [
        MessageTextField(),
        SendingButton(sendMessageContent: sendMessageContent),
      ],
    );
  }
}
