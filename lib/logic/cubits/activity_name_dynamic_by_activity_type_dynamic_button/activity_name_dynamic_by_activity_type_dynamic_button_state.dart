part of 'activity_name_dynamic_by_activity_type_dynamic_button_cubit.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonState extends Equatable {
  final List<String> chosenActivityTitleList;

  const ActivityNameDynamicByActivityTypeDynamicButtonState({
    required this.chosenActivityTitleList,
  });

  @override
  List<Object?> get props => [chosenActivityTitleList];

  ActivityNameDynamicByActivityTypeDynamicButtonState copyWith({
    List<String>? chosenActivityTitleList,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicButtonState(
      chosenActivityTitleList:
          chosenActivityTitleList ??
              this.chosenActivityTitleList,
    );
  }

  @override
  String toString() =>
      'ActivityNameDynamicByActivityTypeDynamicButtonState(chosenActivityTitleList: $chosenActivityTitleList)';
}
