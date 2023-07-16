import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_training_request_among_training_request_dynamic_of_user_state.dart';

class ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit
    extends Cubit<
        ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState> {
  ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit()
      : super(
            ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState(
                chosenTrainingRequestDynamicList: []));

  void pressTrainingRequest(TrainingRequestDynamic trainingRequestDynamic) {
    final state = this.state;

    if (state.chosenTrainingRequestDynamicList.isNotEmpty) {
      state.chosenTrainingRequestDynamicList.clear();
    }

    emit(state.copyWith(
        chosenTrainingRequestDynamicList: List.from(
            state.chosenTrainingRequestDynamicList
              ..add(trainingRequestDynamic))));
  }

  // void pressCancelButton(TrainingRequestDynamic trainingRequestDynamic) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingRequestDynamicList: List.from(
  //           state.chosenTrainingRequestDynamicList
  //             ..remove(trainingRequestDynamic))));
  // }
}
