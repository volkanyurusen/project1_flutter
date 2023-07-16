import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingMessageResponseContainer extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final VoidCallback onTap;
  final String imageUrl;
  final String activityTitle;
  final String responseNumber;
  final double screenWidth;
  final String? typeOfContainer;

  CoachingMessageResponseContainer({
    required this.onTap,
    required this.imageUrl,
    required this.activityTitle,
    required this.responseNumber,
    required this.screenWidth,
    this.typeOfContainer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxWidth = (screenWidth - 54) / 2;
    double positionSpace = 5.0;
    Color activityTitleBoxColor = _appColors.primary.withOpacity(0.75);
    final TextStyle activityTitleTextStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(
            color: _appColors.scaffoldBackgroundColor,
            fontWeight: FontWeight.bold);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          _createActivityImageAndTitleTextArea(boxWidth, positionSpace,
              activityTitleTextStyle, activityTitleBoxColor),
          _createResponseDetail(boxWidth),
        ],
      ),
    );
  }

  /// CREATE ===========================================================================================================
  /// Image Box And Title ----------------------------------------------------------------------------------------------
  Stack _createActivityImageAndTitleTextArea(
    double boxWidth,
    double positionSpace,
    TextStyle activityTitleTextStyle,
    Color activityTitleBoxColor,
  ) =>
      Stack(
        children: [
          _createImageBoxArea(boxWidth),
          _createActivityTitleArea(
              positionSpace, activityTitleBoxColor, activityTitleTextStyle),
        ],
      );

  // _createImageBoxArea
  // height = 550 => 2 boxes appear and take all screen height
  // height = 250 => 4 boxes appear and take all screen height
  // height = 150 => 6 boxes appear and take all screen height
  Container _createImageBoxArea(double boxWidth) => Container(
        padding: _appVisualConstants.miniPaddingOnlyLeft,
        height: 250,
        width: boxWidth,
        decoration: _imageBoxDecoration(),
      );

  Positioned _createActivityTitleArea(
    double positionSpace,
    Color activityTitleBoxColor,
    TextStyle activityTitleTextStyle,
  ) =>
      Positioned(
        bottom: positionSpace,
        left: positionSpace,
        child: _createActivityTitleText(
            activityTitleBoxColor, activityTitleTextStyle),
      );

  Container _createActivityTitleText(
    Color activityTitleBoxColor,
    TextStyle activityTitleTextStyle,
  ) =>
      Container(
        padding: _appVisualConstants.miniPadding,
        color: activityTitleBoxColor,
        child: _displayActivitytitle(activityTitleTextStyle),
      );

  Container _createResponseDetail(
    double boxWidth,
  ) =>
      Container(
        padding: _appVisualConstants.miniPadding,
        height: 30,
        width: boxWidth,
        decoration: _detailBoxDecoration(),
        child: _createResponseArea(),
      );

  AppHeader _createResponseArea() => AppHeader(
      firstWidget: AppHeader(
          firstWidget: _displayResponseIcon(),
          //
          // firstWidget: Icon(Icons.assignment_ind_outlined),
          // firstWidget: Icon(Icons.assignment_ind_rounded),
          secondWidget: const CustomAppSizedBox(width: 5.0),
          thirdWidget: _displayResponceText()));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayActivitytitle(
    TextStyle activityTitleTextStyle,
  ) =>
      AppHeaderText(
          textLabel: _appFunctions.setWithoutUnderscore(activityTitle),
          textStyle: activityTitleTextStyle);

  Icon _displayResponseIcon() => const Icon(Icons.chat_outlined, size: 18);

  AppHeaderText _displayResponceText() => AppHeaderText(
      textLabel: '$responseNumber ${typeOfContainer ?? 'response'}');

  /// BOX DECOARAIONS ==================================================================================================
  BoxDecoration _imageBoxDecoration() => BoxDecoration(
        border: Border.all(color: _appColors.unselectedContainerColor),
        borderRadius: _appVisualConstants.borderRadiusCircularTop,
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imageUrl)),
      );

  BoxDecoration _detailBoxDecoration() => BoxDecoration(
        color: Colors.transparent,
        border: Border(
            left: _createBorderSideOfDetailBoxDecoration(),
            right: _createBorderSideOfDetailBoxDecoration(),
            bottom: _createBorderSideOfDetailBoxDecoration()),
      );

  BorderSide _createBorderSideOfDetailBoxDecoration() =>
      BorderSide(width: 1, color: _appColors.unselectedContainerColor);
}
