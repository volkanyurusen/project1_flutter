part of 'chosen_coach_among_those_who_found_cubit.dart';

class ChosenCoachAmongThoseWhoFoundState
    extends Equatable {
  final List<TrainingOfferResponseDynamicWithDistance>
      chosenTrainingOfferResponseDynamicWithDistanceList;

  const ChosenCoachAmongThoseWhoFoundState({
    required this.chosenTrainingOfferResponseDynamicWithDistanceList,
  });

  ChosenCoachAmongThoseWhoFoundState copyWith({
    List<TrainingOfferResponseDynamicWithDistance>?
        chosenTrainingOfferResponseDynamicWithDistanceList,
  }) {
    return ChosenCoachAmongThoseWhoFoundState(
      chosenTrainingOfferResponseDynamicWithDistanceList:
          chosenTrainingOfferResponseDynamicWithDistanceList ??
              this.chosenTrainingOfferResponseDynamicWithDistanceList,
    );
  }

  @override
  List<Object> get props =>
      [chosenTrainingOfferResponseDynamicWithDistanceList];
}
