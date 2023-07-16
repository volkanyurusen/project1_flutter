part of 'time_period_dynamic_button_on_activity_template_adding_pop_up_cubit.dart';

class TimePeriodDynamicButtonOnActivityTemplateAddingPopUpState
    extends Equatable {
  final List<String> chosenTimePeriodNameList;

  const TimePeriodDynamicButtonOnActivityTemplateAddingPopUpState({
    required this.chosenTimePeriodNameList,
  });

  @override
  List<Object?> get props => [chosenTimePeriodNameList];

  TimePeriodDynamicButtonOnActivityTemplateAddingPopUpState copyWith({
    List<String>? chosenTimePeriodNameList,
  }) {
    return TimePeriodDynamicButtonOnActivityTemplateAddingPopUpState(
      chosenTimePeriodNameList:
          chosenTimePeriodNameList ?? this.chosenTimePeriodNameList,
    );
  }

  @override
  String toString() =>
      'TimePeriodDynamicButtonOnActivityTemplateAddingPopUpState(chosenTimePeriodNameList: $chosenTimePeriodNameList)';
}
