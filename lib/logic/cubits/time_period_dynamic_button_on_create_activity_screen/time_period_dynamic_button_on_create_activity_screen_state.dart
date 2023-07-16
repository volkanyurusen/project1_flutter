part of 'time_period_dynamic_button_on_create_activity_screen_cubit.dart';

class TimePeriodDynamicButtonOnCreateActivityScreenState extends Equatable {
  final List<String> chosenTimePeriodNameList;

  const TimePeriodDynamicButtonOnCreateActivityScreenState({
    required this.chosenTimePeriodNameList,
  });

  @override
  List<Object?> get props => [chosenTimePeriodNameList];

  TimePeriodDynamicButtonOnCreateActivityScreenState copyWith({
    List<String>? chosenTimePeriodNameList,
  }) {
    return TimePeriodDynamicButtonOnCreateActivityScreenState(
      chosenTimePeriodNameList:
          chosenTimePeriodNameList ?? this.chosenTimePeriodNameList,
    );
  }

  @override
  String toString() =>
      'TimePeriodDynamicButtonOnCreateActivityScreenState(chosenTimePeriodNameList: $chosenTimePeriodNameList)';
}
