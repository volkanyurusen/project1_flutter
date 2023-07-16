part of 'chosen_activity_among_created_activity_dynamic_created_by_user_cubit.dart';

class ChosenActivityAmongCreatedActivityDynamicCreatedByUserState
    extends Equatable {
  final List<CreatedActivityDynamicWithDistance>
      chosenCreatedActivityDynamicWithDistanceList;

  const ChosenActivityAmongCreatedActivityDynamicCreatedByUserState({
    required this.chosenCreatedActivityDynamicWithDistanceList,
  });

  ChosenActivityAmongCreatedActivityDynamicCreatedByUserState
      copyWith({
    List<CreatedActivityDynamicWithDistance>?
        chosenCreatedActivityDynamicWithDistanceList,
  }) {
    return ChosenActivityAmongCreatedActivityDynamicCreatedByUserState(
      chosenCreatedActivityDynamicWithDistanceList:
          chosenCreatedActivityDynamicWithDistanceList ??
              this.chosenCreatedActivityDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props => [chosenCreatedActivityDynamicWithDistanceList];
}
