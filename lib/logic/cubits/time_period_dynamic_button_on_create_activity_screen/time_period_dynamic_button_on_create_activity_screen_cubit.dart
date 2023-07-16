import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'time_period_dynamic_button_on_create_activity_screen_state.dart';

class TimePeriodDynamicButtonOnCreateActivityScreenCubit
    extends Cubit<TimePeriodDynamicButtonOnCreateActivityScreenState> {
  TimePeriodDynamicButtonOnCreateActivityScreenCubit()
      // ignore: prefer_const_constructors
      : super(TimePeriodDynamicButtonOnCreateActivityScreenState(
            chosenTimePeriodNameList: const []));

  void pressedTimePeriodDynamicButtonOnCreateActivityScreen(
      String timePeriodDynamic) {
    final statusState = state;

    if (statusState.chosenTimePeriodNameList.isNotEmpty) {
      statusState.chosenTimePeriodNameList.clear();
      emit(statusState.copyWith(
          chosenTimePeriodNameList:
              List.from(statusState.chosenTimePeriodNameList)
                ..add(timePeriodDynamic)));
    } else {
      emit(statusState.copyWith(
          chosenTimePeriodNameList:
              List.from(statusState.chosenTimePeriodNameList)
                ..add(timePeriodDynamic)));
    }
  }

  void cleanTimePeriodDynamicButtonOnCreateActivityScreen() {
    emit(state.copyWith(
        chosenTimePeriodNameList: List.from(state.chosenTimePeriodNameList)
          ..clear()));
  }
}
