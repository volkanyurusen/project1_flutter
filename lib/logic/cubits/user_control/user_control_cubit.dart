import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'user_control_state.dart';

class UserControlCubit extends Cubit<UserControlState> {
  UserControlCubit() : super(UserControlState(userControlList: []));

  void addDetailInList(String? fieldText) {
    final state = this.state;

    if (state.userControlList.isNotEmpty) {
      state.userControlList.clear();
    }

    emit(state.copyWith(
        userControlList: List.from(state.userControlList..add(fieldText!))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       groupedTrainingOfferConversationDynamicList: List.from(
  //           state.groupedTrainingOfferConversationDynamicList..clear())));
  // }
}
