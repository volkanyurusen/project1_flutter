import 'package:flutter/material.dart';
import 'package:my_project/constants/app_constants.dart';
import 'package:my_project/widgets/widget.dart';

class CardInformationColumn extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  final String username;
  final String distance;

  // final String activityLevelDetail;
  // final String activityTitle;

  CardInformationColumn({
    required this.username,
    required this.distance,
    // required this.activityLevelDetail,
    // required this.activityTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? usernameTextStyle =
        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
    TextStyle? distanceTextStyle = const TextStyle(fontSize: 14);
    // TextStyle? bodyLarge = Theme.of(context).textTheme.bodyLarge!;
    return SizedBox(
      height: _appNumberConstants.cardInformationHeight,
      child: CustomColumn(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username, style: usernameTextStyle, textAlign: TextAlign.left),
          Text('nearly $distance km', style: distanceTextStyle),
          // Text('($activityLevelDetail)', style: bodyLarge),
          // const CustomAppSizedBox(height: 25),
          // Text(activityTitle, style: headlineSmall),
        ],
      ),
    );
  }
}
