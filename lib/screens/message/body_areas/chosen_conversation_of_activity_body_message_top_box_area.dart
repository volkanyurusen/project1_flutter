import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../../../models/models_dynamics.dart';
import '../local_widgets/zlocal_widget.dart';

class ChosenConversationOfActivityBodyMessageTopBoxArea
    extends StatelessWidget {
  final Set<int?> uniqueSetOfAttendeeId;

  const ChosenConversationOfActivityBodyMessageTopBoxArea({
    Key? key,
    required this.uniqueSetOfAttendeeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit =
        context.read<ChosenActivityConversationDynamicByUserCubit>();
    final double screenWidth = context.width;
    final TextStyle bodyLarge = context.textTheme.bodyLarge!;

    return _createMessageTopBoxArea(context,
        chosenActivityConversationDynamicByUserCubit, screenWidth, bodyLarge);
  }

  /// CREATE ===========================================================================================================
  MessageTopBox _createMessageTopBoxArea(
    BuildContext context,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    double screenWidth,
    TextStyle bodyLarge,
  ) =>
      MessageTopBox(
        child: Row(
          children: [
            _generateHostImageArea(
                context,
                chosenActivityConversationDynamicByUserCubit,
                screenWidth,
                bodyLarge),
            const CustomAppSizedBox(width: 15),
            _generateAttendeeImageArea(
                chosenActivityConversationDynamicByUserCubit, bodyLarge)
          ],
        ),
      );

  /// GENERATE =========================================================================================================
  MessageTopHostImageBox _generateHostImageArea(
    BuildContext context,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    double screenWidth,
    TextStyle bodyLarge,
  ) =>
      MessageTopHostImageBox(
          numberOfAttendees: uniqueSetOfAttendeeId.length,
          child: _displayHostBox(
              context,
              chosenActivityConversationDynamicByUserCubit,
              screenWidth,
              bodyLarge));

  MessageTopAttendeeImageScrollBox _generateAttendeeImageArea(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    TextStyle bodyLarge,
  ) =>
      MessageTopAttendeeImageScrollBox(
          itemCount: uniqueSetOfAttendeeId.length,
          itemBuilder: (context, index) => _displayAttendeeBox(
              index, chosenActivityConversationDynamicByUserCubit, bodyLarge));

  /// DISPLAY ==========================================================================================================
  UserCardOfMessage _displayHostBox(
    BuildContext context,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    double screenWidth,
    TextStyle bodyLarge,
  ) =>
      UserCardOfMessage(
        onTap: () {
          if (kDebugMode) {
            print(chosenActivityConversationDynamicByUserCubit
                .state
                .chosenActivityConversationDynamicList
                .first
                .consistedActivityDynamic
                .createdActivityDynamic
                .host
                .uId);
          }
        }, // ?This method will go to the HostCard!!!
        imageUrl:
            _displayHostPhoto(chosenActivityConversationDynamicByUserCubit),
        textStyle: bodyLarge,
        username:
            _displayHostUsername(chosenActivityConversationDynamicByUserCubit),
      );

  String _displayHostPhoto(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) =>
      chosenActivityConversationDynamicByUserCubit
          .state
          .chosenActivityConversationDynamicList
          .first
          .consistedActivityDynamic
          .createdActivityDynamic
          .host
          .picUrl;

  String _displayHostUsername(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
  ) =>
      chosenActivityConversationDynamicByUserCubit
          .state
          .chosenActivityConversationDynamicList
          .first
          .consistedActivityDynamic
          .createdActivityDynamic
          .host
          .username;

  UserCardOfMessage _displayAttendeeBox(
    int index,
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    TextStyle bodyLarge,
  ) {
    //
    // print(chosenActivityConversationDynamicByUserCubit
    //     .state.chosenActivityConversationDynamicByUser.length);
    // print(uniqueSetOfAttendeeId.length);
    // print(index);
    // for (var element in chosenActivityConversationDynamicByUserCubit
    //     .state.chosenActivityConversationDynamicByUser) {
    //   print('activityConversationId is: ${element.activityConversationId}');
    //   print(
    //       'consistedActivityId is:${element.consistedActivityDynamic.consistedActivityId}');
    //   print('attendeeId is:${element.consistedActivityDynamic.attendee.uId}');
    //   print(
    //       'createdActivityId is:${element.consistedActivityDynamic.createdActivityDynamic.createdActivityId}');
    //   print(
    //       'hostId is:${element.consistedActivityDynamic.createdActivityDynamic.host.uId}');
    // }
    // print(uniqueSetOfAttendeeId);
    // print(index);
    return UserCardOfMessage(
        onTap: () {
          if (kDebugMode) {
            print('attendeeId is: ${uniqueSetOfAttendeeId.elementAt(index)}');
          }
        }, // ?This method will go to the ChosenAttendeeCard!!!
        leftPadding: 10,
        imageUrl: _displayAttendeePhoto(
            chosenActivityConversationDynamicByUserCubit, index),
        username: _displayAtttendeeUsername(
            chosenActivityConversationDynamicByUserCubit, index),
        textStyle: bodyLarge);
  }

  String _displayAtttendeeUsername(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    int index,
  ) =>
      makeListFromUniqueAttendee(
              chosenActivityConversationDynamicByUserCubit, index)
          .elementAt(index)
          .consistedActivityDynamic
          .attendee
          .username;

  String _displayAttendeePhoto(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    int index,
  ) =>
      makeListFromUniqueAttendee(
              chosenActivityConversationDynamicByUserCubit, index)
          .elementAt(index)
          .consistedActivityDynamic
          .attendee
          .picUrl;

  /// METHOD ===========================================================================================================
  //
  // List<ActivityConversationDynamic> makeListFromUniqueAttendee(
  //   ChosenConsistedActivityDynamicWithDistanceByIndividualCreatedActivityCubit
  //       chosenConsistedActivityDynamicWithDistanceByIndividualCreatedActivityCubit,
  //   int index,
  // ) =>
  //     chosenConsistedActivityDynamicWithDistanceByIndividualCreatedActivityCubit
  //         .state.chosenConsistedActivityDynamicWithDistanceByIndividualCreatedActivity
  //         .where((element) =>
  //             element.attendee.uId ==
  //             uniqueSetOfAttendeeId.elementAt(index))
  //         .toList();
  List<ActivityConversationDynamic> makeListFromUniqueAttendee(
    ChosenActivityConversationDynamicByUserCubit
        chosenActivityConversationDynamicByUserCubit,
    int index,
  ) =>
      chosenActivityConversationDynamicByUserCubit
          .state.chosenActivityConversationDynamicList
          .where((element) =>
              element.consistedActivityDynamic.attendee.uId ==
              uniqueSetOfAttendeeId.elementAt(index))
          .toList();
}
