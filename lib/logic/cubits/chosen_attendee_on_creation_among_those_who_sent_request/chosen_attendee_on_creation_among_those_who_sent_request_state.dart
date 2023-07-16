part of 'chosen_attendee_on_creation_among_those_who_sent_request_cubit.dart';

class ChosenAttendeeOnCreationAmongThoseWhoSentRequestState extends Equatable {
  final List<ConsistedActivityDynamicWithDistance>
      chosenConsistedActivityDynamicWithDistanceList;

  const ChosenAttendeeOnCreationAmongThoseWhoSentRequestState({
    required this.chosenConsistedActivityDynamicWithDistanceList,
  });

  ChosenAttendeeOnCreationAmongThoseWhoSentRequestState copyWith({
    List<ConsistedActivityDynamicWithDistance>?
        chosenConsistedActivityDynamicWithDistanceList,
  }) {
    return ChosenAttendeeOnCreationAmongThoseWhoSentRequestState(
      chosenConsistedActivityDynamicWithDistanceList:
          chosenConsistedActivityDynamicWithDistanceList ??
              this.chosenConsistedActivityDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props => [chosenConsistedActivityDynamicWithDistanceList];
}
