part of 'activity_type_dynamic_button_on_activity_template_updating_pop_up_bloc.dart';

class ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState extends Equatable {
  final List<String> chosenActivityTypeDynamicList;

  const ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState({
    required this.chosenActivityTypeDynamicList,
  });

  ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState copyWith({
    List<String>? chosenActivityTypeDynamicList,
  }) =>
      ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState(
        chosenActivityTypeDynamicList:
            chosenActivityTypeDynamicList ?? this.chosenActivityTypeDynamicList,
      );

  @override
  List<Object> get props => [chosenActivityTypeDynamicList];
}
