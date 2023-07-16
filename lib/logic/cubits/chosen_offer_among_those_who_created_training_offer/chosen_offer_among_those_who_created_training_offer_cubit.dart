import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_offer_among_those_who_created_training_offer_state.dart';

class ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
    extends Cubit<ChosenOfferAmongThoseWhoCreatedTrainingOfferState> {
  ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit()
      : super(ChosenOfferAmongThoseWhoCreatedTrainingOfferState(
            chosenTrainingOfferDynamicWithDistanceList: []));

  void pressChosenOffer(
      TrainingOfferDynamicWithDistance trainingOfferDynamicWithDistance) {
    final state = this.state;

    if (state.chosenTrainingOfferDynamicWithDistanceList.isNotEmpty) {
      state.chosenTrainingOfferDynamicWithDistanceList.clear();
    }

    emit(state.copyWith(
        chosenTrainingOfferDynamicWithDistanceList: List.from(
            state.chosenTrainingOfferDynamicWithDistanceList
              ..add(trainingOfferDynamicWithDistance))));
  }

  // void pressBackButton(
  //     TrainingOfferDynamicWithDistance trainingOfferDynamicWithDistance) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingOfferDynamicWithDistanceList: List.from(
  //           state.chosenTrainingOfferDynamicWithDistanceList
  //             ..remove(trainingOfferDynamicWithDistance))));
  // }
}
