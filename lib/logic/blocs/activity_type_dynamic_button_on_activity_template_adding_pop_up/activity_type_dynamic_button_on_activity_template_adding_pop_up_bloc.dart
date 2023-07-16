import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_type_dynamic_button_on_activity_template_adding_pop_up_event.dart';
part 'activity_type_dynamic_button_on_activity_template_adding_pop_up_state.dart';

class ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc extends Bloc<
    ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpEvent,
    ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState> {
  ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc()
      : super(const ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState(
            chosenActivityTypeDynamicList: [])) {
    on<PressActivityTypeDynamicButtonOnActivityTemplateAddingPopUp>(
        onPressActivityTypeDynamicButtonOnActivityTemplateAddingPopUp);
    on<CleanActivityTypeDynamicButtonOnActivityTemplateAddingPopUp>(
        onCleanActivityTypeDynamicButtonOnActivityTemplateAddingPopUp);
  }

  void onPressActivityTypeDynamicButtonOnActivityTemplateAddingPopUp(
      PressActivityTypeDynamicButtonOnActivityTemplateAddingPopUp event,
      Emitter<ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState>
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

  FutureOr<void> onCleanActivityTypeDynamicButtonOnActivityTemplateAddingPopUp(
      CleanActivityTypeDynamicButtonOnActivityTemplateAddingPopUp event,
      Emitter<ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState>
          emit) {
    if (state.chosenActivityTypeDynamicList.isNotEmpty) {
      emit(state.copyWith(
          chosenActivityTypeDynamicList:
              List.from(state.chosenActivityTypeDynamicList)..clear()));
    }
  }
}
