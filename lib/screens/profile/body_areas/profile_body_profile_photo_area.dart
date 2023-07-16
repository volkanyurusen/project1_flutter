import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class ProfileBodyProfilePhotoArea extends StatelessWidget {
  const ProfileBodyProfilePhotoArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDynamicState userDynamicState = context.read<UserDynamicBloc>().state;
    double photoContainerHeight = 200;
    double positionSpace = 18;
    double circularProfilePhotoRadius = 80;
    TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium!;
    TextStyle? bodyLarge = Theme.of(context).textTheme.bodyLarge!;

    return CustomColumn(
      children: [
        _createProfilePhotoArea(
            context,
            userDynamicState,
            photoContainerHeight,
            positionSpace,
            circularProfilePhotoRadius,
            displayMedium,
            bodyLarge),
        const CustomAppSizedBox(),
      ],
    );
  }

  Stack _createProfilePhotoArea(
    BuildContext context,
    UserDynamicState userDynamicState,
    double photoContainerHeight,
    double positionSpace,
    double circularProfilePhotoRadius,
    TextStyle displayMedium,
    TextStyle bodyLarge,
  ) =>
      Stack(
        children: [
          _createPhotoContainerArea(userDynamicState, photoContainerHeight),
          Positioned(
            bottom: positionSpace,
            left: positionSpace,
            child: _createProfilePhotoAndUsernameArea(context, userDynamicState,
                circularProfilePhotoRadius, displayMedium, bodyLarge),
          ),
        ],
      );

  /// CREATE ===========================================================================================================
  Container _createPhotoContainerArea(
    UserDynamicState userDynamicState,
    double photoContainerHeight,
  ) =>
      Container(
        height: photoContainerHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.20,
            image: _displayUserProfilePhotoOnBackground(userDynamicState),
          ),
        ),
      );

  AppHeader _createProfilePhotoAndUsernameArea(
    BuildContext context,
    UserDynamicState userDynamicState,
    double circularProfilePhotoRadius,
    TextStyle displayMedium,
    TextStyle bodyLarge,
  ) =>
      AppHeader(
        firstWidget: _displayCircularProfilePhoto(
            userDynamicState, circularProfilePhotoRadius),
        secondWidget: AppHeader(
          firstWidget: const CustomAppSizedBox(width: 18),
          secondWidget:
              _createUsernameArea(userDynamicState, displayMedium, bodyLarge),
        ),
      );

  CustomColumn _createUsernameArea(
    UserDynamicState userDynamicState,
    TextStyle displayMedium,
    TextStyle bodyLarge,
  ) =>
      CustomColumn(children: [
        _displayUsername(userDynamicState, displayMedium),
        const CustomAppSizedBox(height: 5),
        _createEditPhotoLink(bodyLarge),
      ]);

  GestureDetector _createEditPhotoLink(
    TextStyle bodyLarge,
  ) =>
      GestureDetector(
          onTap: () {
            if (kDebugMode) {
              print('Edit photo has been clicked!!!');
            }
          } ,
          child: _displayEditPhotoText(bodyLarge));

  /// DISPLAY ==========================================================================================================
  NetworkImage _displayUserProfilePhotoOnBackground(
    UserDynamicState userDynamicState,
  ) =>
      NetworkImage(userDynamicState.userDynamicList.last.picUrl);

  UserImageContainer _displayCircularProfilePhoto(
    UserDynamicState userDynamicState,
    double circularProfilePhotoRadius,
  ) =>
      UserImageContainer(
          height: circularProfilePhotoRadius,
          width: circularProfilePhotoRadius,
          url: userDynamicState.userDynamicList.last.picUrl);

  AppHeaderText _displayUsername(
    UserDynamicState userDynamicState,
    TextStyle displayMedium,
  ) =>
      AppHeaderText(
          textLabel: userDynamicState.userDynamicList.last.username,
          textStyle: displayMedium);

  AppHeaderText _displayEditPhotoText(
    TextStyle bodyLarge,
  ) =>
      AppHeaderText(textLabel: 'Edit photo', textStyle: bodyLarge);
}
