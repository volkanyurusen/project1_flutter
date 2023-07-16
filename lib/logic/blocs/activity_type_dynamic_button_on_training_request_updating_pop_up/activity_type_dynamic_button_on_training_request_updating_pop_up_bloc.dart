import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_type_dynamic_button_on_training_request_updating_pop_up_event.dart';
part 'activity_type_dynamic_button_on_training_request_updating_pop_up_state.dart';

class ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpBloc extends Bloc<
    ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpEvent,
    ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpState> {
  ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpBloc()
      : super(
            const ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpState(
                chosenActivityTypeDynamicList: [])) {
    on<PressActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUp>(
        onPressActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUp);
  }

  void onPressActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUp(
      PressActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUp event,
      Emitter<ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpState>
          emit) {
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
