part of 'chosen_training_offer_response_among_training_offer_response_dynamic_of_trainee_cubit.dart';

class ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState
    extends Equatable {
  final List<TrainingOfferResponseDynamic>
      chosenTrainingOfferResponseDynamicList;

  const ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState({
    required this.chosenTrainingOfferResponseDynamicList,
  });

  ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState
      copyWith({
    List<TrainingOfferResponseDynamic>? chosenTrainingOfferResponseDynamicList,
  }) {
    return ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState(
      chosenTrainingOfferResponseDynamicList:
          chosenTrainingOfferResponseDynamicList ??
              this.chosenTrainingOfferResponseDynamicList,
    );
  }

  @override
  List<Object> get props => [chosenTrainingOfferResponseDynamicList];
}
