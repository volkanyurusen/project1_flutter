import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_button_on_find_a_coach_screen_state.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit
    extends Cubit<
        ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState> {
  ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit()
      : super(
            const ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState(
                chosenActivityTitleList: []));

  void pressedActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreen(
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

  void cleanActivityNameDynamicButton() {
    emit(state.copyWith(
        chosenActivityTitleList: List.from(state.chosenActivityTitleList)
          ..clear()));
  }
}
