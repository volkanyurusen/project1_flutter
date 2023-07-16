part of 'activity_type_dynamic_button_on_activity_template_adding_pop_up_bloc.dart';

class ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState
    extends Equatable {
  final List<String> chosenActivityTypeDynamicList;

  const ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState({
    required this.chosenActivityTypeDynamicList,
  });

  ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState copyWith({
    List<String>? chosenActivityTypeDynamicList,
  }) =>
      ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState(
        chosenActivityTypeDynamicList:
            chosenActivityTypeDynamicList ?? this.chosenActivityTypeDynamicList,
      );

  @override
  List<Object> get props => [chosenActivityTypeDynamicList];
}
