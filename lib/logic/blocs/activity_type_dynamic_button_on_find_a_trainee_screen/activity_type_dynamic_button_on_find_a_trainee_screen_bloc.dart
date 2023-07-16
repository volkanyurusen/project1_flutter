import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_type_dynamic_button_on_find_a_trainee_screen_event.dart';
part 'activity_type_dynamic_button_on_find_a_trainee_screen_state.dart';

class ActivityTypeDynamicButtonOnFindATraineeScreenBloc extends Bloc<
    ActivityTypeDynamicButtonOnFindATraineeScreenEvent,
    ActivityTypeDynamicButtonOnFindATraineeScreenState> {
  ActivityTypeDynamicButtonOnFindATraineeScreenBloc()
      : super(const ActivityTypeDynamicButtonOnFindATraineeScreenState(
            chosenActivityTypeDynamicList: [])) {
    on<PressActivityTypeDynamicButtonOnFindATraineeScreen>(
        onPressActivityTypeDynamicButtonOnFindATraineeScreen);
  }

  void onPressActivityTypeDynamicButtonOnFindATraineeScreen(
      PressActivityTypeDynamicButtonOnFindATraineeScreen event,
      Emitter<ActivityTypeDynamicButtonOnFindATraineeScreenState> emit) {
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
