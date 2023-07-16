part of 'time_period_dynamic_button_on_activity_template_updating_pop_up_cubit.dart';

class TimePeriodDynamicButtonOnActivityTemplateUpdatingPopUpState
    extends Equatable {
  final List<String> chosenTimePeriodNameList;

  const TimePeriodDynamicButtonOnActivityTemplateUpdatingPopUpState({
    required this.chosenTimePeriodNameList,
  });

  @override
  List<Object?> get props => [chosenTimePeriodNameList];

  TimePeriodDynamicButtonOnActivityTemplateUpdatingPopUpState copyWith({
    List<String>? chosenTimePeriodNameList,
  }) {
    return TimePeriodDynamicButtonOnActivityTemplateUpdatingPopUpState(
      chosenTimePeriodNameList:
          chosenTimePeriodNameList ?? this.chosenTimePeriodNameList,
    );
  }

  @override
  String toString() =>
      'TimePeriodDynamicButtonOnActivityTemplateUpdatingPopUpState(chosenTimePeriodNameList: $chosenTimePeriodNameList)';
}
