import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_attendee_on_creation_among_those_who_sent_request_state.dart';

class ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
    extends Cubit<ChosenAttendeeOnCreationAmongThoseWhoSentRequestState> {
  ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit()
      : super(ChosenAttendeeOnCreationAmongThoseWhoSentRequestState(
            chosenConsistedActivityDynamicWithDistanceList: []));

  void pressChosenAttendeeOnCreation(
      ConsistedActivityDynamicWithDistance
          consistedActivityDynamicWithDistance) {
    final state = this.state;

    if (state.chosenConsistedActivityDynamicWithDistanceList.isNotEmpty) {
      state.chosenConsistedActivityDynamicWithDistanceList.clear();
    }
    emit(state.copyWith(
        chosenConsistedActivityDynamicWithDistanceList: List.from(
            state.chosenConsistedActivityDynamicWithDistanceList
              ..add(consistedActivityDynamicWithDistance))));
  }

  // void pressBackButton(
  //     ConsistedActivityDynamicWithDistance
  //         consistedActivityDynamicWithDistance) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenConsistedActivityDynamicWithDistanceList: List.from(
  //           state.chosenConsistedActivityDynamicWithDistanceList
  //             ..remove(consistedActivityDynamicWithDistance))));
  // }
}
