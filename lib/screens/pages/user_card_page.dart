import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

import 'bodies/xbodies.dart';

class UserCardPage extends StatelessWidget {
  static const String routeName = 'user_card_screen';
  final VoidCallback unchooseTheChosenUser;
  final String heroTag;
  final int? userId;
  final String userPhotoUrl;
  final String username;
  final double distance;
  final VoidCallback clickFollowButton;
  final VoidCallback clickLikeButton;
  final String aboutUser;

  const UserCardPage({
    required this.unchooseTheChosenUser,
    required this.heroTag,
    required this.userPhotoUrl,
    required this.userId,
    required this.username,
    required this.distance,
    required this.aboutUser,
    required this.clickFollowButton,
    required this.clickLikeButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => _implementThisBeforeCloseThePage(context),
        child: Scaffold(
          appBar: const CustomAppBar(),
          body: UserCardBody(
            heroTag: heroTag,
            userPhotoUrl: userPhotoUrl,
            username: username,
            distance: distance,
            userId: userId!,
            aboutUser: aboutUser,
            clickFollowButton: () {
              clickFollowButton();
              if (kDebugMode) {
                print('Follow button has been just clicked');
              }
            },
            clickLikeButton: () {
              clickLikeButton();
              if (kDebugMode) {
                print('Like button has been just clicked');
              }
            },
          ),
        ));
  }

  Future<bool> _implementThisBeforeCloseThePage(BuildContext context) {
    unchooseTheChosenUser();
    Navigator.of(context).pop();
    return Future(() => true);
  }
}
