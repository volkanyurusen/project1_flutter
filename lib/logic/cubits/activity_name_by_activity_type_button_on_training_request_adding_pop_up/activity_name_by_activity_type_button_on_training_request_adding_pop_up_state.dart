part of 'activity_name_by_activity_type_button_on_training_request_adding_pop_up_cubit.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState
    extends Equatable {
  final List<String> chosenActivityTitleList;

  const ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState({
    required this.chosenActivityTitleList,
  });

  @override
  List<Object?> get props => [chosenActivityTitleList];

  ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState
      copyWith({
    List<String>? chosenActivityTitleList,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState(
      chosenActivityTitleList:
          chosenActivityTitleList ?? this.chosenActivityTitleList,
    );
  }

  @override
  String toString() =>
      'ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState(chosenActivityTitleList: $chosenActivityTitleList)';
}
