part of 'activity_type_dynamic_button_on_training_request_adding_pop_up_bloc.dart';

class ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState
    extends Equatable {
  final List<String> chosenActivityTypeDynamicList;

  const ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState({
    required this.chosenActivityTypeDynamicList,
  });

  ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState copyWith({
    List<String>? chosenActivityTypeDynamicList,
  }) =>
      ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState(
        chosenActivityTypeDynamicList:
            chosenActivityTypeDynamicList ?? this.chosenActivityTypeDynamicList,
      );

  @override
  List<Object> get props => [chosenActivityTypeDynamicList];
}
