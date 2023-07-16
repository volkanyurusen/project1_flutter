import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_request_among_those_who_created_training_request_state.dart';

class ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
    extends Cubit<ChosenRequestAmongThoseWhoCreatedTrainingRequestState> {
  ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit()
      : super(ChosenRequestAmongThoseWhoCreatedTrainingRequestState(
            chosenTrainingRequestDynamicWithDistanceList: []));

  void pressChosenRequest(
      TrainingRequestDynamicWithDistance trainingRequestDynamicWithDistance) {
    final state = this.state;

    if (state.chosenTrainingRequestDynamicWithDistanceList.isNotEmpty) {
      state.chosenTrainingRequestDynamicWithDistanceList.clear();
    }
    emit(state.copyWith(
        chosenTrainingRequestDynamicWithDistanceList: List.from(
            state.chosenTrainingRequestDynamicWithDistanceList
              ..add(trainingRequestDynamicWithDistance))));
  }

  // void pressBackButton(
  //     TrainingRequestDynamicWithDistance trainingRequestDynamicWithDistance) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingRequestDynamicWithDistanceList: List.from(
  //           state.chosenTrainingRequestDynamicWithDistanceList
  //             ..remove(trainingRequestDynamicWithDistance))));
  // }
}
