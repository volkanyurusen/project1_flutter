part of 'activity_name_dynamic_by_activity_type_dynamic_button_on_find_a_coach_screen_cubit.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState
    extends Equatable {
  final List<String> chosenActivityTitleList;

  const ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState({
    required this.chosenActivityTitleList,
  });

  @override
  List<Object?> get props => [chosenActivityTitleList];

  ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState
      copyWith({
    List<String>? chosenActivityTitleList,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState(
      chosenActivityTitleList:
          chosenActivityTitleList ?? this.chosenActivityTitleList,
    );
  }

  @override
  String toString() =>
      'ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState(chosenActivityTitleList: $chosenActivityTitleList)';
}
