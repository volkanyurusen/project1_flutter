part of 'chosen_training_offer_among_training_offer_dynamic_of_coach_cubit.dart';

class ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState
    extends Equatable {
  final List<TrainingOfferDynamic> chosenTrainingOfferDynamicList;

  const ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState({
    required this.chosenTrainingOfferDynamicList,
  });

  ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState copyWith({
    List<TrainingOfferDynamic>? chosenTrainingOfferDynamicList,
  }) {
    return ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState(
      chosenTrainingOfferDynamicList:
          chosenTrainingOfferDynamicList ?? this.chosenTrainingOfferDynamicList,
    );
  }

  @override
  List<Object> get props => [chosenTrainingOfferDynamicList];
}
