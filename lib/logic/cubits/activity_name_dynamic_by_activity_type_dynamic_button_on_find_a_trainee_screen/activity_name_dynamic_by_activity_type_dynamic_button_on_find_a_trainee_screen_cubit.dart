import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_button_on_find_a_trainee_screen_state.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit
    extends Cubit<
        ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState> {
  ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit()
      // ignore: prefer_const_constructors
      : super(
            const ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState(
                chosenActivityTitleList: []));

  void
      pressedActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreen(
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
}
