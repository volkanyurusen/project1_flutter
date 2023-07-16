import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../../../models/models_dynamics.dart';
import '../local_widgets/zlocal_widget.dart';

class ChosenConversationOfTrainingOfferBodyMessageTopBoxArea
    extends StatelessWidget {
  final Set<int?> uniqueSetOfTraineeId;

  const ChosenConversationOfTrainingOfferBodyMessageTopBoxArea({
    Key? key,
    required this.uniqueSetOfTraineeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit =
        context.read<ChosenTrainingOfferConversationDynamicByUserCubit>();
    final double screenWidth = MediaQuery.of(context).size.width;
    final TextStyle bodyLarge = Theme.of(context).textTheme.bodyLarge!;

    return _createMessageTopBoxArea(
        context,
        chosenTrainingOfferConversationDynamicByUserCubit,
        screenWidth,
        bodyLarge);
  }

  /// CREATE ===========================================================================================================
  MessageTopBox _createMessageTopBoxArea(
    BuildContext context,
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    double screenWidth,
    TextStyle bodyLarge,
  ) =>
      MessageTopBox(
        child: Row(
          children: [
            _generateHostImageArea(
                context,
                chosenTrainingOfferConversationDynamicByUserCubit,
                screenWidth,
                bodyLarge),
            const CustomAppSizedBox(width: 15),
            _generateTraineeImageArea(
                chosenTrainingOfferConversationDynamicByUserCubit, bodyLarge)
          ],
        ),
      );

  /// GENERATE =========================================================================================================
  MessageTopHostImageBox _generateHostImageArea(
    BuildContext context,
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    double screenWidth,
    TextStyle bodyLarge,
  ) =>
      MessageTopHostImageBox(
          numberOfAttendees: uniqueSetOfTraineeId.length,
          child: _displayHostBox(
              context,
              chosenTrainingOfferConversationDynamicByUserCubit,
              screenWidth,
              bodyLarge));

  MessageTopAttendeeImageScrollBox _generateTraineeImageArea(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    TextStyle bodyLarge,
  ) =>
      MessageTopAttendeeImageScrollBox(
          itemCount: uniqueSetOfTraineeId.length,
          itemBuilder: (context, index) => _displayAttendeeBox(
              chosenTrainingOfferConversationDynamicByUserCubit,
              index,
              bodyLarge));

  /// DISPLAY ==========================================================================================================
  UserCardOfMessage _displayHostBox(
    BuildContext context,
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    double screenWidth,
    TextStyle bodyLarge,
  ) =>
      UserCardOfMessage(
        onTap: () {
          if (kDebugMode) {
            print(chosenTrainingOfferConversationDynamicByUserCubit
                .state
                .chosenTrainingOfferConversationDynamicList
                .first
                .trainingOfferResponseDynamic
                .trainingOfferDynamic
                .coachDynamic
                .userDynamic
                .uId);
          }
        }, // ?This method will go to the HostCard!!!
        imageUrl: _displayHostPhoto(
            chosenTrainingOfferConversationDynamicByUserCubit),
        textStyle: bodyLarge,
        username: _displayHostUsername(
            chosenTrainingOfferConversationDynamicByUserCubit),
      );

  String _displayHostPhoto(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
  ) =>
      chosenTrainingOfferConversationDynamicByUserCubit
          .state
          .chosenTrainingOfferConversationDynamicList
          .first
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .coachDynamic
          .userDynamic
          .picUrl;

  String _displayHostUsername(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
  ) =>
      chosenTrainingOfferConversationDynamicByUserCubit
          .state
          .chosenTrainingOfferConversationDynamicList
          .first
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .coachDynamic
          .userDynamic
          .username;

  UserCardOfMessage _displayAttendeeBox(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    int index,
    TextStyle bodyLarge,
  ) {
    //
    // print(chosenTrainingOfferConversationDynamicByUserCubit
    //     .state.chosenTrainingOfferConversationDynamicByUser.length);
    // print(uniqueSetOfTraineeId.length);
    // print(index);
    // for (var element
    //     in chosenTrainingOfferConversationDynamicByUserCubit
    //         .state.chosenTrainingOfferConversationDynamicByUser) {
    //   print(
    //       'TrainingOfferConversationId is: ${element.trainingOfferConversationId}');
    //   print(
    //       'trainingRequestResponseId is:${element.trainingOfferResponseDynamic.trainingOfferResponseId}');
    //   print(
    //       'attendeeId is:${element.trainingOfferResponseDynamic.trainee.uId}');
    //   print(
    //       'trainingOfferId is:${element.trainingOfferResponseDynamic.trainingOfferDynamic.trainingOfferId}');
    //   print(
    //       'hostId is:${element.trainingOfferResponseDynamic.trainingOfferDynamic.coachDynamic.userDynamic.uId}');
    // }
    // print(
    //     'chosenTrainingOfferConversationDynamicByUser is: ${chosenTrainingOfferConversationDynamicByUserCubit.state.chosenTrainingOfferConversationDynamicByUser}');
    // print('uniqueSetOfTraineeId is: $uniqueSetOfTraineeId');
    // print('uniqueSetOfTraineeId.length is: ${uniqueSetOfTraineeId.length}');
    // print('index is: $index');
    return UserCardOfMessage(
        onTap: () {
          if (kDebugMode) {
            print('attendeeId is: ${uniqueSetOfTraineeId.elementAt(index)}');
          }
        }, // ?This method will go to the ChosenAttendeeCard!!!
        leftPadding: 10,
        imageUrl: _displayTraineePhoto(
            chosenTrainingOfferConversationDynamicByUserCubit, index),
        username: _displayAtttendeeUsername(
            chosenTrainingOfferConversationDynamicByUserCubit, index),
        textStyle: bodyLarge);
  }

  String _displayAtttendeeUsername(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    int index,
  ) =>
      makeListFromUniqueTrainee(
              chosenTrainingOfferConversationDynamicByUserCubit, index)
          .elementAt(index)
          .trainingOfferResponseDynamic
          .trainee
          .username;

  String _displayTraineePhoto(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    int index,
  ) =>
      makeListFromUniqueTrainee(
              chosenTrainingOfferConversationDynamicByUserCubit, index)
          .elementAt(index)
          .trainingOfferResponseDynamic
          .trainee
          .picUrl;

  /// METHOD ===========================================================================================================
  //
  // List<TrainingOfferConversationDynamic> makeListFromUniqueTrainee(
  //   ChosenTrainingRequestResponseDynamicWithDistanceByIndividualTrainingOfferCubit
  //       chosenTrainingRequestResponseDynamicWithDistanceByIndividualTrainingOfferCubit,
  //   int index,
  // ) =>
  //     chosenTrainingRequestResponseDynamicWithDistanceByIndividualTrainingOfferCubit
  //         .state.chosenTrainingRequestResponseDynamicWithDistanceByIndividualTrainingOffer
  //         .where((element) =>
  //             element.trainee.uId ==
  //             uniqueSetOfTraineeId.elementAt(index))
  //         .toList();
  List<TrainingOfferConversationDynamic> makeListFromUniqueTrainee(
    ChosenTrainingOfferConversationDynamicByUserCubit
        chosenTrainingOfferConversationDynamicByUserCubit,
    int index,
  ) =>
      chosenTrainingOfferConversationDynamicByUserCubit
          .state.chosenTrainingOfferConversationDynamicList
          .where((element) =>
              element.trainingOfferResponseDynamic.trainee.uId ==
              uniqueSetOfTraineeId.elementAt(index))
          .toList();
}
