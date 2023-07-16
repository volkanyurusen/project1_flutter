import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/screens/discover/local_widgets/card_information_column.dart';
import 'package:my_project/screens/discover/local_widgets/zlocal_widget.dart';
import 'package:my_project/widgets/widget.dart';


class CardContainer extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();

  final String imageAddress;
  final String username;
  final String heroTag;
  // final String activityLevelDetail;
  // final String activityTitle;
  final String distance;
  // final String activityDate;
  final Widget widget;
  final bool isAttended;

  CardContainer({
    required this.imageAddress,
    required this.username,
    required this.heroTag,

    // required this.activityLevelDetail,
    // required this.activityTitle,
    required this.distance,
    // required this.activityDate,
    required this.widget,
    required this.isAttended,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: isAttended
                  ? _appColors.onSecondary
                  : _appColors.unselectedContainerColor,
              width: 1.5),
          borderRadius: _appVisualConstants.borderRadiusCircular,
          color: isAttended ? _appColors.onSecondary : Colors.transparent),
      child: Row(
        children: [
          CardImageBox(imageAddress: imageAddress, heroTag: heroTag),
          const CustomAppSizedBox(width: 18),
          CardInformationColumn(
            username: username,
            distance: distance,

            // activityLevelDetail: activityLevelDetail,
            // activityTitle: activityTitle,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: CardEndColumn(
              // distance: distance,
              // activityDate: activityDate,
              widget: widget,
            ),
          ),
        ],
      ),
    );
  }
}
