import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_response_among_those_who_responded_training_request_state.dart';

class ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit
    extends Cubit<ChosenResponseAmongThoseWhoRespondedTrainingRequestState> {
  ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit()
      : super(ChosenResponseAmongThoseWhoRespondedTrainingRequestState(
            chosenTrainingRequestResponseDynamicWithDistanceList: []));

  void pressChosenRespond(
      TrainingRequestResponseDynamicWithDistance
          trainingRequestResponseDynamicWithDistance) {
    final state = this.state;

    if (state.chosenTrainingRequestResponseDynamicWithDistanceList.isNotEmpty) {
      state.chosenTrainingRequestResponseDynamicWithDistanceList.clear();
    }

    emit(state.copyWith(
        chosenTrainingRequestResponseDynamicWithDistanceList: List.from(
            state.chosenTrainingRequestResponseDynamicWithDistanceList
              ..add(trainingRequestResponseDynamicWithDistance))));
  }

  // void pressBackButton(
  //     TrainingRequestResponseDynamicWithDistance
  //         trainingRequestResponseDynamicWithDistance) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingRequestResponseDynamicWithDistanceList: List.from(
  //           state.chosenTrainingRequestResponseDynamicWithDistanceList
  //             ..remove(trainingRequestResponseDynamicWithDistance))));
  // }
}
