part of 'activity_name_button_cubit.dart';

class ActivityNameButtonState extends Equatable {
  final List<String> chosenActivityTitleList;

  const ActivityNameButtonState({
    required this.chosenActivityTitleList,
  });

  @override
  List<Object?> get props => [chosenActivityTitleList];

  ActivityNameButtonState copyWith({
    List<String>? chosenActivityTitleList,
  }) {
    return ActivityNameButtonState(
      chosenActivityTitleList:
          chosenActivityTitleList ?? this.chosenActivityTitleList,
    );
  }

  @override
  String toString() =>
      'ActivityNameButtonState(chosenActivityTitleList: $chosenActivityTitleList)';
}
