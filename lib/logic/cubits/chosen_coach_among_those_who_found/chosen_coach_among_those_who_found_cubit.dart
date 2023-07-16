import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_coach_among_those_who_found_state.dart';

class ChosenCoachAmongThoseWhoFoundCubit
    extends Cubit<ChosenCoachAmongThoseWhoFoundState> {
  ChosenCoachAmongThoseWhoFoundCubit()
      : super(ChosenCoachAmongThoseWhoFoundState(
            chosenTrainingOfferResponseDynamicWithDistanceList: []));

  void pressChosenRespond(
      TrainingOfferResponseDynamicWithDistance
          trainingOfferResponseDynamicWithDistance) {
    final state = this.state;

    if (state.chosenTrainingOfferResponseDynamicWithDistanceList.isNotEmpty) {
      state.chosenTrainingOfferResponseDynamicWithDistanceList.clear();
    }

    emit(state.copyWith(
        chosenTrainingOfferResponseDynamicWithDistanceList: List.from(
            state.chosenTrainingOfferResponseDynamicWithDistanceList
              ..add(trainingOfferResponseDynamicWithDistance))));
  }

  // void pressBackButton(
  //     TrainingOfferResponseDynamicWithDistance
  //         trainingOfferResponseDynamicWithDistance) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingOfferResponseDynamicWithDistanceList: List.from(
  //           state.chosenTrainingOfferResponseDynamicWithDistanceList
  //             ..remove(trainingOfferResponseDynamicWithDistance))));
  // }
}
