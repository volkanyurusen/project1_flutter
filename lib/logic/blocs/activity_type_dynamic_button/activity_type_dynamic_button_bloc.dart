import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_type_dynamic_button_event.dart';
part 'activity_type_dynamic_button_state.dart';

class ActivityTypeDynamicButtonBloc extends Bloc<ActivityTypeDynamicButtonEvent,
    ActivityTypeDynamicButtonState> {
  ActivityTypeDynamicButtonBloc()
      : super(
            ActivityTypeDynamicButtonState(chosenActivityTypeDynamicList: [])) {
    on<PressActivityTypeDynamicButton>(onPressActivityTypeDynamicButton);
    on<CleanActivityTypeDynamicButton>(onCleanActivityTypeDynamicButton);
  }

  void onPressActivityTypeDynamicButton(PressActivityTypeDynamicButton event,
      Emitter<ActivityTypeDynamicButtonState> emit) {
    final statusState = state;

    if (statusState.chosenActivityTypeDynamicList
        .contains(event.activityTypeDynamic)) {
      emit(statusState.copyWith(
          chosenActivityTypeDynamicList:
              List.from(statusState.chosenActivityTypeDynamicList)
                ..remove(event.activityTypeDynamic)));
    } else {
      emit(statusState.copyWith(
          chosenActivityTypeDynamicList:
              List.from(statusState.chosenActivityTypeDynamicList)
                ..add(event.activityTypeDynamic)));
    }
  }

  void onCleanActivityTypeDynamicButton(CleanActivityTypeDynamicButton event,
      Emitter<ActivityTypeDynamicButtonState> emit) {
    final statusState = state;

    emit(statusState.copyWith(
        chosenActivityTypeDynamicList:
            List.from(statusState.chosenActivityTypeDynamicList..clear())));
  }
}
