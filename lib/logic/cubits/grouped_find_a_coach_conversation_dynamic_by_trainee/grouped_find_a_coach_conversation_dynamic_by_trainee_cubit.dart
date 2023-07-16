import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'grouped_find_a_coach_conversation_dynamic_by_trainee_state.dart';

class GroupedFindACoachConversationDynamicByTraineeCubit
    extends Cubit<GroupedFindACoachConversationDynamicByTraineeState> {
  GroupedFindACoachConversationDynamicByTraineeCubit()
      : super(GroupedFindACoachConversationDynamicByTraineeState(
            groupedFindACoachConversationDynamicList: []));

  void pressFindACoachConversation(
      List<TrainingOfferConversationDynamic>
          trainingOfferConversationDynamicList) {
    final state = this.state;

    if (state.groupedFindACoachConversationDynamicList.isNotEmpty) {
      state.groupedFindACoachConversationDynamicList.clear();
    }

    emit(state.copyWith(
        groupedFindACoachConversationDynamicList: List.from(
            state.groupedFindACoachConversationDynamicList
              ..addAll(trainingOfferConversationDynamicList))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       groupedFindACoachConversationDynamicList: List.from(
  //           state.groupedFindACoachConversationDynamicList..clear())));
  // }
}
