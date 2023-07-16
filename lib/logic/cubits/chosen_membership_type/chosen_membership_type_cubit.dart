import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';

part 'chosen_membership_type_state.dart';

class ChosenMembershipTypeCubit extends Cubit<ChosenMembershipTypeState> {
  ChosenMembershipTypeCubit()
      : super(ChosenMembershipTypeState(chosenMembershipTypeList: []));

  void pressChosenMembershipType(MembershipType chosenMembershipType) {
    final state = this.state;

    if (state.chosenMembershipTypeList.isNotEmpty) {
      state.chosenMembershipTypeList.clear();
    }

    emit(state.copyWith(
        chosenMembershipTypeList: List.from(
            state.chosenMembershipTypeList..add(chosenMembershipType))));
  }

  // void pressBackButton(MembershipType chosenMembershipType) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenMembershipTypeList:
  //           List.from(state.chosenMembershipTypeList..clear())));
  // }
}
