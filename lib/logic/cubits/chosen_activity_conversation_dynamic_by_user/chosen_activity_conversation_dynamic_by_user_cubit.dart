import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_activity_conversation_dynamic_by_user_state.dart';

class ChosenActivityConversationDynamicByUserCubit
    extends Cubit<ChosenActivityConversationDynamicByUserState> {
  ChosenActivityConversationDynamicByUserCubit()
      : super(ChosenActivityConversationDynamicByUserState(
            chosenActivityConversationDynamicList: []));

  void pressActivityConversation(
      ActivityConversationDynamic activityConversationDynamic) {
    final state = this.state;

    if (state.chosenActivityConversationDynamicList.isNotEmpty) {
      state.chosenActivityConversationDynamicList.clear();
    }
    emit(state.copyWith(
        chosenActivityConversationDynamicList: List.from(
            state.chosenActivityConversationDynamicList
              ..add(activityConversationDynamic))));
  }

  // void pressCancelButton(
  //     ActivityConversationDynamic activityConversationDynamic) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenActivityConversationDynamicList: List.from(
  //           state.chosenActivityConversationDynamicList
  //             ..remove(activityConversationDynamic))));
  // }
}
