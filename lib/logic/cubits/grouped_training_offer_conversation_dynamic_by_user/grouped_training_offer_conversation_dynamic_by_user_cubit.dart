import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'grouped_training_offer_conversation_dynamic_by_user_state.dart';

class GroupedTrainingOfferConversationDynamicByUserCubit
    extends Cubit<GroupedTrainingOfferConversationDynamicByUserState> {
  GroupedTrainingOfferConversationDynamicByUserCubit()
      : super(GroupedTrainingOfferConversationDynamicByUserState(
            groupedTrainingOfferConversationDynamicList: []));

  void pressTrainingOfferConversation(
      List<TrainingOfferConversationDynamic>
          trainingOfferConversationDynamicList) {
    final state = this.state;

    if (state.groupedTrainingOfferConversationDynamicList.isNotEmpty) {
      state.groupedTrainingOfferConversationDynamicList.clear();
    }

    emit(state.copyWith(
        groupedTrainingOfferConversationDynamicList: List.from(
            state.groupedTrainingOfferConversationDynamicList
              ..addAll(trainingOfferConversationDynamicList))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       groupedTrainingOfferConversationDynamicList: List.from(
  //           state.groupedTrainingOfferConversationDynamicList..clear())));
  // }
}
