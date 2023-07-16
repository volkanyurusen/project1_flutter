import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class CoachCard extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final double screenHeight;
  final double screenWidth;
  final String heroTag;
  final ImageProvider<Object> image;
  final String username;
  final String coachingNameForIcon;
  final int coachingPrice;
  final String coachingExperience;
  final double distance;
  final bool isResponded;

  CoachCard({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.heroTag,
    required this.image,
    required this.username,
    required this.coachingNameForIcon,
    required this.coachingPrice,
    required this.coachingExperience,
    required this.distance,
    required this.isResponded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? bodyMedium = Theme.of(context).textTheme.bodyMedium!;

    return CustomColumn(
      children: [
        const CustomAppSizedBox(),
        Container(
          height: screenHeight * 0.30,
          width: screenWidth * 0.43,
          decoration: BoxDecoration(
            border: Border.all(
                color: isResponded
                    ? _appColors.onSecondary
                    : _appColors.unselectedContainerColor),
            borderRadius: _appVisualConstants.borderRadiusSmallCircular,
            color: isResponded ? _appColors.onSecondary : Colors.transparent,
          ),
          child: Column(
            children: [
              Hero(
                tag: heroTag,
                child: Container(
                  height: screenHeight * 0.22,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: image, fit: BoxFit.fill),
                    borderRadius: _appVisualConstants.borderRadiusCircularTop,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                child: Column(children: [
                  AppHeader(
                    firstWidget: Row(
                      children: [
                        AppHeaderText(textLabel: username),
                      ],
                    ),
                    thirdWidget: AppHeaderText(
                        textLabel: ' \$ ${coachingPrice.toString()}'),
                  ),
                  const CustomAppSizedBox(height: 5.0),
                  AppHeader(
                    firstWidget: AppHeaderText(
                        textLabel: coachingExperience,
                        textStyle:
                            bodyMedium.copyWith(color: _appColors.primary)),
                    thirdWidget: AppHeaderText(
                        textLabel: '${distance.round().toString()} km',
                        textStyle: bodyMedium),
                  )
                ]),
              ),
            ],
          ),
        ),
        const CustomAppSizedBox(),
      ],
    );
  }
}
