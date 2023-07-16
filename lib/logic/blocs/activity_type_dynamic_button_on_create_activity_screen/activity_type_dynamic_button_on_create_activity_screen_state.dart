part of 'activity_type_dynamic_button_on_create_activity_screen_bloc.dart';

class ActivityTypeDynamicButtonOnCreateActivityScreenState extends Equatable {
  final List<String> chosenActivityTypeDynamicList;

  const ActivityTypeDynamicButtonOnCreateActivityScreenState({
    required this.chosenActivityTypeDynamicList,
  });

  ActivityTypeDynamicButtonOnCreateActivityScreenState copyWith({
    List<String>? chosenActivityTypeDynamicList,
  }) =>
      ActivityTypeDynamicButtonOnCreateActivityScreenState(
        chosenActivityTypeDynamicList:
            chosenActivityTypeDynamicList ?? this.chosenActivityTypeDynamicList,
      );

  @override
  List<Object> get props => [chosenActivityTypeDynamicList];
}
