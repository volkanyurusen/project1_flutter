part of 'activity_name_dynamic_by_activity_type_dynamic_button_on_create_activity_screen_cubit.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreenState
    extends Equatable {
  final List<String> chosenActivityTitleList;

  const ActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreenState({
    required this.chosenActivityTitleList,
  });

  @override
  List<Object?> get props =>
      [chosenActivityTitleList];

  ActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreenState
      copyWith({
    List<String>? chosenActivityTitleList,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreenState(
      chosenActivityTitleList:
          chosenActivityTitleList ??
              this.chosenActivityTitleList,
    );
  }

  @override
  String toString() =>
      'ActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreenState(chosenActivityTitleList: $chosenActivityTitleList)';
}
