part of 'chosen_result_of_chosen_activity_dynamic_cubit.dart';

class ChosenResultOfChosenActivityDynamicState extends Equatable {
  final List<CreatedActivityDynamicWithDistance>
      chosenCreatedActivityDynamicWithDistanceList;

  const ChosenResultOfChosenActivityDynamicState({
    required this.chosenCreatedActivityDynamicWithDistanceList,
  });

  ChosenResultOfChosenActivityDynamicState copyWith({
    List<CreatedActivityDynamicWithDistance>?
        chosenCreatedActivityDynamicWithDistanceList,
  }) {
    return ChosenResultOfChosenActivityDynamicState(
      chosenCreatedActivityDynamicWithDistanceList:
          chosenCreatedActivityDynamicWithDistanceList ??
              this.chosenCreatedActivityDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props => [chosenCreatedActivityDynamicWithDistanceList];
}
