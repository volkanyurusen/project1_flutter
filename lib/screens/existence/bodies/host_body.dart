import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/existence/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class HostBody extends StatelessWidget {
  final ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit;

  const HostBody({
    required this.chosenHostWhoCreatedActivityCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return UserCardScrollAppBody(
      child: BlocBuilder<ChosenHostWhoCreatedActivityCubit,
          ChosenHostWhoCreatedActivityState>(builder: (context, chosenState) {
        return Column(
          children: [
            HostBodyProfilePhotoArea(
                chosenHostWhoCreatedActivityCubit:
                    chosenHostWhoCreatedActivityCubit),
            HostBodyUsernameArea(
                chosenHostWhoCreatedActivityCubit:
                    chosenHostWhoCreatedActivityCubit),
            HostBodyFollowsAndLikeArea(
                chosenHostWhoCreatedActivityCubit:
                    chosenHostWhoCreatedActivityCubit,
                screenWidth: screenWidth),
            HostBodyAmountBoxArea(
                chosenHostWhoCreatedActivityCubit:
                    chosenHostWhoCreatedActivityCubit,
                screenWidth: screenWidth),
            HostBodyAboutUserArea(
                chosenHostWhoCreatedActivityCubit:
                    chosenHostWhoCreatedActivityCubit),
            HostBodyRecentActivityArea(screenWidth: screenWidth),
          ],
        );
      }),
    );
  }
}
