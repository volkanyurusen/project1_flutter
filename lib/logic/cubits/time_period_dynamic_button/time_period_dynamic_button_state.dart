part of 'time_period_dynamic_button_cubit.dart';

class TimePeriodDynamicButtonState extends Equatable {
  final List<String> chosenTimePeriodDynamicList;

  const TimePeriodDynamicButtonState({
    required this.chosenTimePeriodDynamicList,
  });

  @override
  List<Object?> get props => [chosenTimePeriodDynamicList];

  TimePeriodDynamicButtonState copyWith({
    List<String>? chosenTimePeriodDynamicList,
  }) {
    return TimePeriodDynamicButtonState(
      chosenTimePeriodDynamicList:
          chosenTimePeriodDynamicList ?? this.chosenTimePeriodDynamicList,
    );
  }

  @override
  String toString() =>
      'TimePeriodDynamicButtonState(chosenTimePeriodDynamicList: $chosenTimePeriodDynamicList)';
}
