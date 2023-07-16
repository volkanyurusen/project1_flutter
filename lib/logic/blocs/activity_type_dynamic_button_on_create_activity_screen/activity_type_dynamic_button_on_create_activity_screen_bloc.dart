import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_type_dynamic_button_on_create_activity_screen_event.dart';
part 'activity_type_dynamic_button_on_create_activity_screen_state.dart';

class ActivityTypeDynamicButtonOnCreateActivityScreenBloc extends Bloc<
    ActivityTypeDynamicButtonOnCreateActivityScreenEvent,
    ActivityTypeDynamicButtonOnCreateActivityScreenState> {
  ActivityTypeDynamicButtonOnCreateActivityScreenBloc()
      : super(const ActivityTypeDynamicButtonOnCreateActivityScreenState(
            chosenActivityTypeDynamicList: [])) {
    on<PressActivityTypeDynamicButtonOnCreateActivityScreen>(
        onPressActivityTypeDynamicButtonOnCreateActivityScreen);
    on<CleanActivityTypeDynamicButtonOnCreateActivityScreen>(
        onCleanActivityTypeDynamicButtonOnCreateActivityScreen);
  }

  void onPressActivityTypeDynamicButtonOnCreateActivityScreen(
      PressActivityTypeDynamicButtonOnCreateActivityScreen event,
      Emitter<ActivityTypeDynamicButtonOnCreateActivityScreenState> emit) {
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

  void onCleanActivityTypeDynamicButtonOnCreateActivityScreen(
      CleanActivityTypeDynamicButtonOnCreateActivityScreen event,
      Emitter<ActivityTypeDynamicButtonOnCreateActivityScreenState> emit) {
    final statusState = state;

    emit(statusState.copyWith(
        chosenActivityTypeDynamicList:
            List.from(statusState.chosenActivityTypeDynamicList)..clear()));
  }
}
