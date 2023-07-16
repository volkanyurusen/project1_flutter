import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_name_by_activity_type_button_on_training_request_adding_pop_up_state.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit
    extends Cubit<
        ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState> {
  ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit()
      // ignore: prefer_const_constructors
      : super(
            const ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState(
                chosenActivityTitleList: []));

  void
      pressedActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUp(
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
