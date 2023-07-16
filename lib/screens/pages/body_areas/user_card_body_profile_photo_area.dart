import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class UserCardBodyProfilePhotoArea extends StatelessWidget {
  final String heroTag;
  final String userPhotoUrl;

  const UserCardBodyProfilePhotoArea({
    required this.heroTag,
    required this.userPhotoUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _displayProfilePhotoWithHero(),
        const CustomAppSizedBox(),
      ],
    );
  }

  UserPageHero _displayProfilePhotoWithHero() =>
      UserPageHero(tag: heroTag, url: userPhotoUrl);
}
