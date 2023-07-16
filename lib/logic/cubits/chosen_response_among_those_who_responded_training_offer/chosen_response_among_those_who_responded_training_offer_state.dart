part of 'chosen_response_among_those_who_responded_training_offer_cubit.dart';

class ChosenResponseAmongThoseWhoRespondedTrainingOfferState extends Equatable {
  final List<TrainingOfferResponseDynamicWithDistance>
      chosenTrainingOfferResponseDynamicWithDistanceList;

  const ChosenResponseAmongThoseWhoRespondedTrainingOfferState({
    required this.chosenTrainingOfferResponseDynamicWithDistanceList,
  });

  ChosenResponseAmongThoseWhoRespondedTrainingOfferState copyWith({
    List<TrainingOfferResponseDynamicWithDistance>?
        chosenTrainingOfferResponseDynamicWithDistanceList,
  }) {
    return ChosenResponseAmongThoseWhoRespondedTrainingOfferState(
      chosenTrainingOfferResponseDynamicWithDistanceList:
          chosenTrainingOfferResponseDynamicWithDistanceList ??
              this.chosenTrainingOfferResponseDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props =>
      [chosenTrainingOfferResponseDynamicWithDistanceList];
}
