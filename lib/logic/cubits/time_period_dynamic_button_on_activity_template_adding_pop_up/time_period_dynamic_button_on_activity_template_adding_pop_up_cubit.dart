import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'time_period_dynamic_button_on_activity_template_adding_pop_up_state.dart';

class TimePeriodDynamicButtonOnActivityTemplateAddingPopUpCubit
    extends Cubit<TimePeriodDynamicButtonOnActivityTemplateAddingPopUpState> {
  TimePeriodDynamicButtonOnActivityTemplateAddingPopUpCubit()
      // ignore: prefer_const_constructors
      : super(TimePeriodDynamicButtonOnActivityTemplateAddingPopUpState(
            chosenTimePeriodNameList: const []));

  void pressedTimePeriodDynamicButtonOnActivityTemplateAddingPopUp(
      String timePeriodDynamic) {
    final statusState = state;

    if (statusState.chosenTimePeriodNameList.isNotEmpty) {
      statusState.chosenTimePeriodNameList.clear();
    }
    emit(statusState.copyWith(
        chosenTimePeriodNameList:
            List.from(statusState.chosenTimePeriodNameList)
              ..add(timePeriodDynamic)));
  }

  void cleanTimePeriodDynamicButtonOnActivityTemplateAddingPopUp() {
    if (state.chosenTimePeriodNameList.isNotEmpty) {
      emit(state.copyWith(
          chosenTimePeriodNameList: List.from(state.chosenTimePeriodNameList)
            ..clear()));
    }
  }
}
