import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_type_dynamic_button_on_activity_template_updating_pop_up_event.dart';
part 'activity_type_dynamic_button_on_activity_template_updating_pop_up_state.dart';

class ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc extends Bloc<
    ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpEvent,
    ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState> {
  ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc()
      : super(
            const ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState(
                chosenActivityTypeDynamicList: [])) {
    on<PressActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp>(
        onPressActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp);
    on<CleanActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp>(
        onCleanActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp);
  }

  FutureOr<void>
      onPressActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp(
          PressActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp event,
          Emitter<ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState>
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

  FutureOr<void>
      onCleanActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp(
          CleanActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp event,
          Emitter<ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState>
              emit) {
    if (state.chosenActivityTypeDynamicList.isNotEmpty) {
      emit(state.copyWith(
          chosenActivityTypeDynamicList:
              List.from(state.chosenActivityTypeDynamicList)..clear()));
    }
  }
}
