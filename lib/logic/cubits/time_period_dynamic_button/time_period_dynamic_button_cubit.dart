import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'time_period_dynamic_button_state.dart';

class TimePeriodDynamicButtonCubit extends Cubit<TimePeriodDynamicButtonState> {
  TimePeriodDynamicButtonCubit()
      : super(TimePeriodDynamicButtonState(
            chosenTimePeriodDynamicList: const []));

  void pressedTimePeriodDynamicButton(String timePeriodDynamic) {
    final statusState = state;

    if (statusState.chosenTimePeriodDynamicList.contains(timePeriodDynamic)) {
      emit(statusState.copyWith(
          chosenTimePeriodDynamicList:
              List.from(statusState.chosenTimePeriodDynamicList)
                ..remove(timePeriodDynamic)));
    } else {
      emit(statusState.copyWith(
          chosenTimePeriodDynamicList:
              List.from(statusState.chosenTimePeriodDynamicList)
                ..add(timePeriodDynamic)));
    }
  }

  // void unpressedTimePeriodDynamicButton(String timePeriodDynamic) {
  //   final statusState = state;

  //   emit(statusState.copyWith(
  //       chosenTimePeriodDynamicList:
  //           List.from(statusState.chosenTimePeriodDynamicList)
  //             ..remove(timePeriodDynamic)));
  // }

  void cleanTimePeriodDynamicButton() {
    final statusState = state;

    emit(statusState.copyWith(
        chosenTimePeriodDynamicList:
            List.from(statusState.chosenTimePeriodDynamicList)..clear()));
  }
}
