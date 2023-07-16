part of 'chosen_response_among_those_who_responded_training_request_cubit.dart';

class ChosenResponseAmongThoseWhoRespondedTrainingRequestState
    extends Equatable {
  final List<TrainingRequestResponseDynamicWithDistance>
      chosenTrainingRequestResponseDynamicWithDistanceList;

  const ChosenResponseAmongThoseWhoRespondedTrainingRequestState({
    required this.chosenTrainingRequestResponseDynamicWithDistanceList,
  });

  ChosenResponseAmongThoseWhoRespondedTrainingRequestState copyWith({
    List<TrainingRequestResponseDynamicWithDistance>?
        chosenTrainingRequestResponseDynamicWithDistanceList,
  }) {
    return ChosenResponseAmongThoseWhoRespondedTrainingRequestState(
      chosenTrainingRequestResponseDynamicWithDistanceList:
          chosenTrainingRequestResponseDynamicWithDistanceList ??
              this.chosenTrainingRequestResponseDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props =>
      [chosenTrainingRequestResponseDynamicWithDistanceList];
}
