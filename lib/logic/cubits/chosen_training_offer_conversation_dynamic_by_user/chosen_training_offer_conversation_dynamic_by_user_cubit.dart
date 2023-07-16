import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_training_offer_conversation_dynamic_by_user_state.dart';

class ChosenTrainingOfferConversationDynamicByUserCubit
    extends Cubit<ChosenTrainingOfferConversationDynamicByUserState> {
  ChosenTrainingOfferConversationDynamicByUserCubit()
      : super(ChosenTrainingOfferConversationDynamicByUserState(
            chosenTrainingOfferConversationDynamicList: []));

  void pressTrainingOfferConversation(
      TrainingOfferConversationDynamic trainingOfferConversationDynamic) {
    final state = this.state;

    if (state.chosenTrainingOfferConversationDynamicList.isNotEmpty) {
      state.chosenTrainingOfferConversationDynamicList.clear();
    }

    emit(state.copyWith(
        chosenTrainingOfferConversationDynamicList: List.from(
            state.chosenTrainingOfferConversationDynamicList
              ..add(trainingOfferConversationDynamic))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingOfferConversationDynamicList: List.from(
  //           state.chosenTrainingOfferConversationDynamicList..clear())));
  // }
}
