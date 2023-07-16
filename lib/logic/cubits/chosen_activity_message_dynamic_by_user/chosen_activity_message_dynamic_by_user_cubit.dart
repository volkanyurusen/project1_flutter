import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_activity_message_dynamic_by_user_state.dart';

class ChosenActivityMessageDynamicByUserCubit
    extends Cubit<ChosenActivityMessageDynamicByUserState> {
  ChosenActivityMessageDynamicByUserCubit()
      : super(ChosenActivityMessageDynamicByUserState(
            chosenActivityMessageDynamicList: []));

  void pressMessage(MessageDynamic chosenActivityMessageDynamic) {
    final state = this.state;

    if (state.chosenActivityMessageDynamicList.isNotEmpty) {
      state.chosenActivityMessageDynamicList.clear();
    }
    emit(state.copyWith(
        chosenActivityMessageDynamicList: List.from(
            state.chosenActivityMessageDynamicList
              ..add(chosenActivityMessageDynamic))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenActivityMessageDynamicList:
  //           List.from(state.chosenActivityMessageDynamicList..clear())));
  // }
}
