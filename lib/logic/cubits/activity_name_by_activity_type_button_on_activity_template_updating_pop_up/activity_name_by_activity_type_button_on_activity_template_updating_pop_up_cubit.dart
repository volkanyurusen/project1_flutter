import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_name_by_activity_type_button_on_activity_template_updating_pop_up_state.dart';

class ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit
    extends Cubit<
        ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState> {
  ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit()
      // ignore: prefer_const_constructors
      : super(
            const ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState(
                chosenActivityTitleList: []));

  void
      pressedActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUp(
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
      cleanActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUp() {
    if (state.chosenActivityTitleList.isNotEmpty) {
      emit(state.copyWith(
          chosenActivityTitleList:
              List.from(state.chosenActivityTitleList..clear())));
    }
  }
}
