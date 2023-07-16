import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class MessageContentBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();

  final bool isMessageWrittenByAppuser;
  final String username;
  final String messageContent;
  final String messageTime;

  MessageContentBox({
    required this.isMessageWrittenByAppuser,
    required this.username,
    required this.messageContent,
    required this.messageTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double messageBoxMaxWidth = MediaQuery.of(context).size.width * 0.8;
    final Color messageBoxColorOfAppUser = _appColors.primary.withOpacity(0.2);
    final Color messageBoxColorOfOther = _appColors.textColor.withOpacity(0.2);
    final TextStyle messageContentTextStyle =
        Theme.of(context).textTheme.titleLarge!;
    final TextStyle messageTimeTextStyle =
        Theme.of(context).textTheme.bodyLarge!;

    return Align(
      alignment:
          isMessageWrittenByAppuser ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: isMessageWrittenByAppuser
              ? _appVisualConstants.messageBorderRadiusOfAppUser
              : _appVisualConstants.messageBorderRadiusOfOther,
          color: isMessageWrittenByAppuser
              ? messageBoxColorOfAppUser
              : messageBoxColorOfOther,
        ),
        constraints: BoxConstraints(maxWidth: messageBoxMaxWidth),
        padding: _appVisualConstants.messageBoxPadding,
        child: CustomColumn(children: [
          isMessageWrittenByAppuser
              ? const SizedBox()
              : Column(
                  children: [
                    AppHeaderText(textLabel: username),
                    const CustomAppSizedBox(height: 5)
                  ],
                ),
          AppHeaderText(
              textLabel: messageContent, textStyle: messageContentTextStyle),
          Align(
            alignment: Alignment.bottomRight,
            child: AppHeaderText(
                textLabel: messageTime, textStyle: messageTimeTextStyle),
          )
        ]),
      ),
    );
  }
}
