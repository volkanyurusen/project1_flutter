part of 'chosen_result_of_preferred_activity_dynamic_cubit.dart';

class ChosenResultOfPreferredActivityDynamicState extends Equatable {
  final List<ActivityTile>
      chosenCreatedActivityDynamicWithDistanceList;

  const ChosenResultOfPreferredActivityDynamicState({
    required this.chosenCreatedActivityDynamicWithDistanceList,
  });

  ChosenResultOfPreferredActivityDynamicState copyWith({
    List<ActivityTile>?
        chosenCreatedActivityDynamicWithDistanceList,
  }) {
    return ChosenResultOfPreferredActivityDynamicState(
      chosenCreatedActivityDynamicWithDistanceList:
          chosenCreatedActivityDynamicWithDistanceList ??
              this.chosenCreatedActivityDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props => [chosenCreatedActivityDynamicWithDistanceList];
}
