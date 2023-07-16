part of 'chosen_offer_among_those_who_created_training_offer_cubit.dart';

class ChosenOfferAmongThoseWhoCreatedTrainingOfferState extends Equatable {
  final List<TrainingOfferDynamicWithDistance>
      chosenTrainingOfferDynamicWithDistanceList;

  const ChosenOfferAmongThoseWhoCreatedTrainingOfferState({
    required this.chosenTrainingOfferDynamicWithDistanceList,
  });

  ChosenOfferAmongThoseWhoCreatedTrainingOfferState copyWith({
    List<TrainingOfferDynamicWithDistance>?
        chosenTrainingOfferDynamicWithDistanceList,
  }) {
    return ChosenOfferAmongThoseWhoCreatedTrainingOfferState(
      chosenTrainingOfferDynamicWithDistanceList:
          chosenTrainingOfferDynamicWithDistanceList ??
              this.chosenTrainingOfferDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props => [chosenTrainingOfferDynamicWithDistanceList];
}
