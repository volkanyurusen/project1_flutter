part of 'activity_type_dynamic_button_on_training_request_updating_pop_up_bloc.dart';

class ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpState
    extends Equatable {
  final List<String> chosenActivityTypeDynamicList;

  const ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpState({
    required this.chosenActivityTypeDynamicList,
  });

  ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpState copyWith({
    List<String>? chosenActivityTypeDynamicList,
  }) =>
      ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpState(
        chosenActivityTypeDynamicList:
            chosenActivityTypeDynamicList ?? this.chosenActivityTypeDynamicList,
      );

  @override
  List<Object> get props => [chosenActivityTypeDynamicList];
}
