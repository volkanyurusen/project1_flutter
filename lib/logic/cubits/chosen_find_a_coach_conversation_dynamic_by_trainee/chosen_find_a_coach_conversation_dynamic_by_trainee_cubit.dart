import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_find_a_coach_conversation_dynamic_by_trainee_state.dart';

class ChosenFindACoachConversationDynamicByTraineeCubit
    extends Cubit<ChosenFindACoachConversationDynamicByTraineeState> {
  ChosenFindACoachConversationDynamicByTraineeCubit()
      : super(ChosenFindACoachConversationDynamicByTraineeState(
            chosenFindACoachConversationDynamicList: []));

  void pressFindACoachConversation(
      TrainingOfferConversationDynamic trainingOfferConversationDynamic) {
    final state = this.state;

    if (state.chosenFindACoachConversationDynamicList.isNotEmpty) {
      state.chosenFindACoachConversationDynamicList.clear();
    }

    emit(state.copyWith(
        chosenFindACoachConversationDynamicList: List.from(
            state.chosenFindACoachConversationDynamicList
              ..add(trainingOfferConversationDynamic))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenFindACoachConversationDynamicList: List.from(
  //           state.chosenFindACoachConversationDynamicList..clear())));
  // }
}
