import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_training_request_conversation_dynamic_by_user_state.dart';

class ChosenTrainingRequestConversationDynamicByUserCubit
    extends Cubit<ChosenTrainingRequestConversationDynamicByUserState> {
  ChosenTrainingRequestConversationDynamicByUserCubit()
      : super(ChosenTrainingRequestConversationDynamicByUserState(
            chosenTrainingRequestConversationDynamicList: []));

  void pressTrainingRequestConversation(
      TrainingRequestConversationDynamic trainingRequestConversationDynamic) {
    final state = this.state;

    if (state.chosenTrainingRequestConversationDynamicList.isNotEmpty) {
      state.chosenTrainingRequestConversationDynamicList.clear();
    }

    emit(state.copyWith(
        chosenTrainingRequestConversationDynamicList: List.from(
            state.chosenTrainingRequestConversationDynamicList
              ..add(trainingRequestConversationDynamic))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingRequestConversationDynamicList: List.from(
  //           state.chosenTrainingRequestConversationDynamicList..clear())));
  // }
}
