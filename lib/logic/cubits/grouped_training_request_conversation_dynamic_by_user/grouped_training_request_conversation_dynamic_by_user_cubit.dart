import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'grouped_training_request_conversation_dynamic_by_user_state.dart';

class GroupedTrainingRequestConversationDynamicByUserCubit
    extends Cubit<
        GroupedTrainingRequestConversationDynamicByUserState> {
  GroupedTrainingRequestConversationDynamicByUserCubit()
      : super(GroupedTrainingRequestConversationDynamicByUserState(
            groupedTrainingRequestConversationDynamicList: []));

  void pressTrainingRequestConversation(
      List<TrainingRequestConversationDynamic>
          trainingRequestConversationDynamicList) {
    final state = this.state;

    if (state.groupedTrainingRequestConversationDynamicList.isNotEmpty) {
      state.groupedTrainingRequestConversationDynamicList.clear();
    }

    emit(state.copyWith(
        groupedTrainingRequestConversationDynamicList: List.from(
            state.groupedTrainingRequestConversationDynamicList
              ..addAll(trainingRequestConversationDynamicList))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       groupedTrainingRequestConversationDynamicList: List.from(
  //           state.groupedTrainingRequestConversationDynamicList..clear())));
  // }
}
