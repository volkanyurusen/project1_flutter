import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

import 'xbodies.dart';

class UserCardBody extends StatelessWidget {
  final String heroTag;
  final String userPhotoUrl;
  final String username;
  final double distance;
  final VoidCallback clickFollowButton;
  final int userId;
  final VoidCallback clickLikeButton;
  final String aboutUser;

  const UserCardBody({
    required this.heroTag,
    required this.userPhotoUrl,
    required this.username,
    required this.distance,
    required this.clickFollowButton,
    required this.userId,
    required this.clickLikeButton,
    required this.aboutUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserCardScrollAppBody(
        child: Column(
      children: [
        UserCardBodyProfilePhotoArea(
            heroTag: heroTag, userPhotoUrl: userPhotoUrl),
        UserCardBodyUsernameArea(
            username: username,
            distance: distance,
            clickFollowButton: () => clickFollowButton),
        UserCardBodyFollowsAndLikeArea(
            userId: userId, clickLikeButton: () => clickLikeButton),
        UserCardBodyAmountBoxArea(userId: userId),
        UserCardBodyAboutUserArea(aboutUser: aboutUser),
        UserCardBodyRecentActivityArea(),
      ],
    ));
  }
}
