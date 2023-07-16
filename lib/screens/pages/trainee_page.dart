import 'package:flutter/material.dart';
import 'package:my_project/screens/pages/user_card_page.dart';

class TraineePage extends UserCardPage {
  static const String routeName = 'trainee_page';

  const TraineePage(
      final VoidCallback unchooseTheChosenUser,
      final String heroTag,
      final int? userId,
      final String userPhotoUrl,
      final String username,
      final double distance,
      final VoidCallback clickFollowButton,
      final VoidCallback clickLikeButton,
      final String aboutUser,
      Key? key)
      : super(
            key: key,
            aboutUser: aboutUser,
            clickFollowButton: clickFollowButton,
            clickLikeButton: clickLikeButton,
            distance: distance,
            heroTag: heroTag,
            unchooseTheChosenUser: unchooseTheChosenUser,
            userId: userId,
            userPhotoUrl: userPhotoUrl,
            username: username);
}
