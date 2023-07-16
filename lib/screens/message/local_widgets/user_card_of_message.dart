import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class UserCardOfMessage extends StatelessWidget {
  final VoidCallback onTap;
  final String imageUrl;
  final String username;
  final TextStyle textStyle;
  final double leftPadding;

  const UserCardOfMessage({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.username,
    required this.textStyle,
    this.leftPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: leftPadding),
        child: CustomColumn(children: [
          UserImageContainer(
            height: 50,
            width: 50,
            url: imageUrl,
          ),
          AppHeaderText(
              textLabel: '${username.substring(0, 8)}...',
              textStyle: textStyle),
        ]),
      ),
    );
  }
}
