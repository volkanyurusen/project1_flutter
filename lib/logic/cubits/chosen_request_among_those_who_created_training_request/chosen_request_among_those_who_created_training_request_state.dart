part of 'chosen_request_among_those_who_created_training_request_cubit.dart';

class ChosenRequestAmongThoseWhoCreatedTrainingRequestState extends Equatable {
  final List<TrainingRequestDynamicWithDistance>
      chosenTrainingRequestDynamicWithDistanceList;

  const ChosenRequestAmongThoseWhoCreatedTrainingRequestState({
    required this.chosenTrainingRequestDynamicWithDistanceList,
  });

  ChosenRequestAmongThoseWhoCreatedTrainingRequestState copyWith({
    List<TrainingRequestDynamicWithDistance>?
        chosenTrainingRequestDynamicWithDistanceList,
  }) {
    return ChosenRequestAmongThoseWhoCreatedTrainingRequestState(
      chosenTrainingRequestDynamicWithDistanceList:
          chosenTrainingRequestDynamicWithDistanceList ??
              this.chosenTrainingRequestDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props => [chosenTrainingRequestDynamicWithDistanceList];
}
