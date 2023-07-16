import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_name_by_activity_type_button_on_activity_template_adding_pop_up_state.dart';

class ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit
    extends Cubit<
        ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState> {
  ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit()
      // ignore: prefer_const_constructors
      : super(
            const ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState(
                chosenActivityTitleList: []));

  void
      pressedActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUp(
          String activityTitle) {
    final statusState = state;

    if (statusState.chosenActivityTitleList.isNotEmpty) {
      statusState.chosenActivityTitleList.clear();
      emit(statusState.copyWith(
          chosenActivityTitleList:
              List.from(statusState.chosenActivityTitleList)
                ..add(activityTitle)));
    } else {
      emit(statusState.copyWith(
          chosenActivityTitleList:
              List.from(statusState.chosenActivityTitleList)
                ..add(activityTitle)));
    }
  }

  void
      cleanActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUp() {
    if (state.chosenActivityTitleList.isNotEmpty) {
      emit(state.copyWith(
          chosenActivityTitleList:
              List.from(state.chosenActivityTitleList..clear())));
    }
  }
}
