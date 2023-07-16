import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_type_dynamic_button_on_find_a_coach_screen_event.dart';
part 'activity_type_dynamic_button_on_find_a_coach_screen_state.dart';

class ActivityTypeDynamicButtonOnFindACoachScreenBloc extends Bloc<
    ActivityTypeDynamicButtonOnFindACoachScreenEvent,
    ActivityTypeDynamicButtonOnFindACoachScreenState> {
  ActivityTypeDynamicButtonOnFindACoachScreenBloc()
      : super(const ActivityTypeDynamicButtonOnFindACoachScreenState(
            chosenActivityTypeDynamicList: [])) {
    on<PressActivityTypeDynamicButtonOnFindACoachScreen>(
        onPressActivityTypeDynamicButtonOnFindACoachScreen);
    on<CleanActivityTypeDynamicButtonOnFindACoachScreen>(
        onCleanActivityTypeDynamicButtonOnFindACoachScreen);
  }

  void onPressActivityTypeDynamicButtonOnFindACoachScreen(
      PressActivityTypeDynamicButtonOnFindACoachScreen event,
      Emitter<ActivityTypeDynamicButtonOnFindACoachScreenState> emit) {
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

  void onCleanActivityTypeDynamicButtonOnFindACoachScreen(
      CleanActivityTypeDynamicButtonOnFindACoachScreen event,
      Emitter<ActivityTypeDynamicButtonOnFindACoachScreenState> emit) {
    emit(state.copyWith(
        chosenActivityTypeDynamicList:
            List.from(state.chosenActivityTypeDynamicList)..clear()));
  }
}
