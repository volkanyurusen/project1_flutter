part of 'activity_name_dynamic_by_activity_type_dynamic_button_on_find_a_trainee_screen_cubit.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState
    extends Equatable {
  final List<String> chosenActivityTitleList;

  const ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState({
    required this.chosenActivityTitleList,
  });

  @override
  List<Object?> get props => [chosenActivityTitleList];

  ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState
      copyWith({
    List<String>? chosenActivityTitleList,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState(
      chosenActivityTitleList:
          chosenActivityTitleList ?? this.chosenActivityTitleList,
    );
  }

  @override
  String toString() =>
      'ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState(chosenActivityTitleList: $chosenActivityTitleList)';
}
