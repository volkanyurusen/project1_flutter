part of 'chosen_attendee_on_attendance_among_those_who_sent_request_cubit.dart';

class ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState
    extends Equatable {
  final List<ConsistedActivityDynamicWithDistance>
      chosenConsistedActivityDynamicWithDistanceList;

  const ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState({
    required this.chosenConsistedActivityDynamicWithDistanceList,
  });

  ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState copyWith({
    List<ConsistedActivityDynamicWithDistance>?
        chosenConsistedActivityDynamicWithDistanceList,
  }) {
    return ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestState(
      chosenConsistedActivityDynamicWithDistanceList:
          chosenConsistedActivityDynamicWithDistanceList ??
              this.chosenConsistedActivityDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props => [chosenConsistedActivityDynamicWithDistanceList];
}
