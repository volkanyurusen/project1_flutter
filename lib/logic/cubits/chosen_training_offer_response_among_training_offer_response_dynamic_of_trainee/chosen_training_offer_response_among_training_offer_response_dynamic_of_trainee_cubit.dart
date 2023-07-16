import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_training_offer_response_among_training_offer_response_dynamic_of_trainee_state.dart';

class ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit
    extends Cubit<
        ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState> {
  ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit()
      : super(
            ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState(
                chosenTrainingOfferResponseDynamicList: []));

  void pressTraining(
      List<TrainingOfferResponseDynamic> trainingOfferResponseDynamic) {
    final state = this.state;

    if (state.chosenTrainingOfferResponseDynamicList.isNotEmpty) {
      state.chosenTrainingOfferResponseDynamicList.clear();
    }

    emit(state.copyWith(
        chosenTrainingOfferResponseDynamicList: List.from(
            state.chosenTrainingOfferResponseDynamicList
              ..addAll(trainingOfferResponseDynamic))));
  }

  // void pressCancelButton(TrainingOfferResponseDynamic trainingOfferResponseDynamic) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingOfferResponseDynamicList: List.from(
  //           state.chosenTrainingOfferResponseDynamicList
  //             ..remove(trainingOfferResponseDynamic))));
  // }
}
