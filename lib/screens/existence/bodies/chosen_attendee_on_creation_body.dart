// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/existence/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenAttendeeOnCreationBody extends StatelessWidget {
  final ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit;
  final double screenWidth;

  const ChosenAttendeeOnCreationBody({
    required this.chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildUserCardScrollAppBody();
  }

  // BUILD =============================================================================================================
  UserCardScrollAppBody _buildUserCardScrollAppBody() {
    return UserCardScrollAppBody(
      child: BlocBuilder<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
              ChosenAttendeeOnCreationAmongThoseWhoSentRequestState>(
          builder: (context, chosenState) {
        return _createUsercardAreas();
      }),
    );
  }

  // CREATE ============================================================================================================
  Column _createUsercardAreas() {
    return Column(children: [
      ChosenAttendeeOnCreationBodyProfilePhotoArea(
          chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit:
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit),
      ChosenAttendeeOnCreationBodyUsernameArea(
          chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit:
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit),
      ChosenAttendeeOnCreationBodyFollowsAndLikesArea(
          chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit:
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
          screenWidth: screenWidth),
      ChosenAttendeeOnCreationBodyAmountBoxArea(
          chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit:
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
          screenWidth: screenWidth),
      ChosenAttendeeOnCreationBodyAboutUserArea(
          chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit:
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit),
      ChosenAttendeeOnCreationBodyRecentActivityArea(screenWidth: screenWidth),
      ChosenAttendeeOnCreationBodyApproveAndDenyArea(
          chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit:
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
          screenWidth: screenWidth),
    ]);
  }
}
