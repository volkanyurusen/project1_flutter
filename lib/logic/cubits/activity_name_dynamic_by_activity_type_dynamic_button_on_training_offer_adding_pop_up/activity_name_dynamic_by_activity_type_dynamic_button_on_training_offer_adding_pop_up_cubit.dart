import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_button_on_training_offer_adding_pop_up_state.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpCubit
    extends Cubit<
        ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState> {
  ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpCubit()
      // ignore: prefer_const_constructors
      : super(
            const ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState(
                chosenActivityTitleList: []));

  void
      pressedActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUp(
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
