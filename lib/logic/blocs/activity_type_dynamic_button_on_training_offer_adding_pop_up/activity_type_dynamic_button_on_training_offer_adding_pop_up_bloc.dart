import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_type_dynamic_button_on_training_offer_adding_pop_up_event.dart';
part 'activity_type_dynamic_button_on_training_offer_adding_pop_up_state.dart';

class ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc extends Bloc<
    ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpEvent,
    ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState> {
  ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc()
      : super(const ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState(
            chosenActivityTypeDynamicList: [])) {
    on<PressActivityTypeDynamicButtonOnTrainingOfferAddingPopUp>(
        onPressActivityTypeDynamicButtonOnTrainingOfferAddingPopUp);
  }

  void onPressActivityTypeDynamicButtonOnTrainingOfferAddingPopUp(
      PressActivityTypeDynamicButtonOnTrainingOfferAddingPopUp event,
      Emitter<ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState> emit) {
    final statusState = state;

    if (statusState.chosenActivityTypeDynamicList.isNotEmpty) {
      statusState.chosenActivityTypeDynamicList.clear();
      emit(statusState.copyWith(
          chosenActivityTypeDynamicList:
              List.from(statusState.chosenActivityTypeDynamicList)
                ..add(event.activityTypeDynamic)));
    } else {
      emit(statusState.copyWith(
          chosenActivityTypeDynamicList:
              List.from(statusState.chosenActivityTypeDynamicList)
                ..add(event.activityTypeDynamic)));
    }
  }
}
