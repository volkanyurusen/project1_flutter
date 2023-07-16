import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_attendee_on_attendance_among_those_who_sent_request_state.dart';

class ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit
    extends Cubit<ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState> {
  ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit()
      : super(ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState(
            chosenConsistedActivityDynamicWithDistanceList: []));

  void pressChosenAttendeeOnAttendance(
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
