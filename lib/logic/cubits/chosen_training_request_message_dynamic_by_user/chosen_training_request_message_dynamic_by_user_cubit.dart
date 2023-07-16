import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_training_request_message_dynamic_by_user_state.dart';

class ChosenTrainingRequestMessageDynamicByUserCubit
    extends Cubit<ChosenTrainingRequestMessageDynamicByUserState> {
  ChosenTrainingRequestMessageDynamicByUserCubit()
      : super(ChosenTrainingRequestMessageDynamicByUserState(
            chosenTrainingRequestMessageDynamicList: []));

  void pressMessage(
      List<TrainingRequestMessageDynamic> trainingRequestMessageDynamicList) {
    final state = this.state;

    if (state.chosenTrainingRequestMessageDynamicList.isNotEmpty) {
      state.chosenTrainingRequestMessageDynamicList.clear();
    }

    emit(state.copyWith(
        chosenTrainingRequestMessageDynamicList: List.from(
            state.chosenTrainingRequestMessageDynamicList
              ..addAll(trainingRequestMessageDynamicList))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingRequestMessageDynamicList:
  //           List.from(state.chosenTrainingRequestMessageDynamicList..clear())));
  // }
}
