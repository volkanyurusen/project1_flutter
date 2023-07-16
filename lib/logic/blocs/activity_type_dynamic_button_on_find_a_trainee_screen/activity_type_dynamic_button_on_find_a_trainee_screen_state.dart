part of 'activity_type_dynamic_button_on_find_a_trainee_screen_bloc.dart';

class ActivityTypeDynamicButtonOnFindATraineeScreenState extends Equatable {
  final List<String> chosenActivityTypeDynamicList;

  const ActivityTypeDynamicButtonOnFindATraineeScreenState({
    required this.chosenActivityTypeDynamicList,
  });

  ActivityTypeDynamicButtonOnFindATraineeScreenState copyWith({
    List<String>? chosenActivityTypeDynamicList,
  }) =>
      ActivityTypeDynamicButtonOnFindATraineeScreenState(
        chosenActivityTypeDynamicList:
            chosenActivityTypeDynamicList ?? this.chosenActivityTypeDynamicList,
      );

  @override
  List<Object> get props => [chosenActivityTypeDynamicList];
}
