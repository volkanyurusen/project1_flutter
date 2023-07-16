import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_button_on_create_activity_screen_state.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreenCubit
    extends Cubit<
        ActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreenState> {
  ActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreenCubit()
      // ignore: prefer_const_constructors
      : super(
            const ActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreenState(
                chosenActivityTitleList: []));

  void
      pressedActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreen(
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
      cleanActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreen() {
    emit(state.copyWith(
        chosenActivityTitleList: List.from(state.chosenActivityTitleList)
          ..clear()));
  }
}
