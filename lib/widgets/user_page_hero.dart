import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class UserPageHero extends StatelessWidget {
  final String tag;
  final String url;
  const UserPageHero({
    required this.tag,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(tag: tag, child: UserPageImage(url: url));
  }
}