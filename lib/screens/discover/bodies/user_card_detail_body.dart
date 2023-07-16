import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/discover/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class UserCardDetailBody extends StatelessWidget {
  final ResultOfPreferredActivityDynamicBloc
      resultOfPreferredActivityDynamicBloc;
  final ConsistedActivityDynamicWithDistanceAttendedByUserBloc
      consistedActivityDynamicWithDistanceAttendedByUserBloc;

  const UserCardDetailBody({
    Key? key,
    required this.resultOfPreferredActivityDynamicBloc,
    required this.consistedActivityDynamicWithDistanceAttendedByUserBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    ChosenResultOfPreferredActivityDynamicCubit
        chosenResultOfPreferredActivityDynamicCubit =
        context.read<ChosenResultOfPreferredActivityDynamicCubit>();
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge!;

    return ScrollableAppBody(
      child: _bringCardDetailOfChosenUser(
          chosenResultOfPreferredActivityDynamicCubit, screenWidth, titleLarge),
    );
  }

  BlocBuilder<ChosenResultOfPreferredActivityDynamicCubit,
      ChosenResultOfPreferredActivityDynamicState> _bringCardDetailOfChosenUser(
    ChosenResultOfPreferredActivityDynamicCubit
        chosenResultOfPreferredActivityDynamicCubit,
    double screenWidth,
    TextStyle titleLarge,
  ) =>
      BlocBuilder<ChosenResultOfPreferredActivityDynamicCubit,
          ChosenResultOfPreferredActivityDynamicState>(
        builder: (context, state) => Column(
          children: [
            UserCardDetailBodyProfilePhotoArea(
                chosenResultOfPreferredActivityDynamicCubit:
                    chosenResultOfPreferredActivityDynamicCubit),
            UserCardDetailBodyUsernameArea(
                chosenResultOfPreferredActivityDynamicCubit:
                    chosenResultOfPreferredActivityDynamicCubit),
            UserCardDetailBodyFollowsAndLikesArea(
                chosenResultOfPreferredActivityDynamicCubit:
                    chosenResultOfPreferredActivityDynamicCubit,
                screenWidth: screenWidth),
            UserCardDetailBodyAmountBoxArea(
                chosenResultOfPreferredActivityDynamicCubit:
                    chosenResultOfPreferredActivityDynamicCubit,
                screenWidth: screenWidth),
            UserCardDetailBodyAboutUserArea(
                chosenResultOfPreferredActivityDynamicCubit:
                    chosenResultOfPreferredActivityDynamicCubit),
            UserCardDetailBodyRecentActivityArea(screenWidth: screenWidth),
            UserCardDetailBodyAttendTheActivityButtonArea(
                resultOfPreferredActivityDynamicBloc:
                    resultOfPreferredActivityDynamicBloc),
            // _displayAttendTheActivityButton(context),
          ],
        ),
      );
}
