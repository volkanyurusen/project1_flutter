part of 'activity_type_dynamic_button_on_find_a_coach_screen_bloc.dart';

class ActivityTypeDynamicButtonOnFindACoachScreenState extends Equatable {
  final List<String> chosenActivityTypeDynamicList;

  const ActivityTypeDynamicButtonOnFindACoachScreenState({
    required this.chosenActivityTypeDynamicList,
  });

  ActivityTypeDynamicButtonOnFindACoachScreenState copyWith({
    List<String>? chosenActivityTypeDynamicList,
  }) =>
      ActivityTypeDynamicButtonOnFindACoachScreenState(
        chosenActivityTypeDynamicList:
            chosenActivityTypeDynamicList ?? this.chosenActivityTypeDynamicList,
      );

  @override
  List<Object> get props => [chosenActivityTypeDynamicList];
}
