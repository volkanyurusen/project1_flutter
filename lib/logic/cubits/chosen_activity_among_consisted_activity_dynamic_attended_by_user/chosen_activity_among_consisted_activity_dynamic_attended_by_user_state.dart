part of 'chosen_activity_among_consisted_activity_dynamic_attended_by_user_cubit.dart';

class ChosenActivityAmongConsistedActivityDynamicAttendedByUserState
    extends Equatable {
  final List<ConsistedActivityDynamicWithDistance>
      chosenConsistedActivityDynamicWithDistanceList;

  const ChosenActivityAmongConsistedActivityDynamicAttendedByUserState({
    required this.chosenConsistedActivityDynamicWithDistanceList,
  });

  ChosenActivityAmongConsistedActivityDynamicAttendedByUserState
      copyWith({
    List<ConsistedActivityDynamicWithDistance>?
        chosenConsistedActivityDynamicWithDistanceList,
  }) {
    return ChosenActivityAmongConsistedActivityDynamicAttendedByUserState(
      chosenConsistedActivityDynamicWithDistanceList:
          chosenConsistedActivityDynamicWithDistanceList ??
              this.chosenConsistedActivityDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props =>
      [chosenConsistedActivityDynamicWithDistanceList];
}
