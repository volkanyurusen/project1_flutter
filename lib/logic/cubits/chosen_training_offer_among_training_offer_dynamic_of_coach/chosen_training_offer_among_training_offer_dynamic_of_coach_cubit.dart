import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_training_offer_among_training_offer_dynamic_of_coach_state.dart';

class ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit
    extends Cubit<
        ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState> {
  ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit()
      : super(
            ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState(
                chosenTrainingOfferDynamicList: []));

  void pressTrainingOffer(TrainingOfferDynamic trainingOfferDynamic) {
    final state = this.state;

    if (state.chosenTrainingOfferDynamicList.isNotEmpty) {
      state.chosenTrainingOfferDynamicList.clear();
    }

    emit(state.copyWith(
        chosenTrainingOfferDynamicList: List.from(
            state.chosenTrainingOfferDynamicList..add(trainingOfferDynamic))));
  }

  // void pressCancelButton(TrainingOfferDynamic trainingOfferDynamic) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingOfferDynamicList: List.from(
  //           state.chosenTrainingOfferDynamicList
  //             ..remove(trainingOfferDynamic))));
  // }
}
