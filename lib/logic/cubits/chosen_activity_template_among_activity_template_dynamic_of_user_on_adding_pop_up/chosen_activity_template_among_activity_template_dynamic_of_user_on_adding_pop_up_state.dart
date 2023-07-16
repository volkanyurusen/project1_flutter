part of 'chosen_activity_template_among_activity_template_dynamic_of_user_on_adding_pop_up_cubit.dart';

class ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpState
    extends Equatable {
  final List<ActivityTemplateDynamic> chosenActivityTemplateList;

  const ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpState({
    required this.chosenActivityTemplateList,
  });

  ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpState copyWith({
    List<ActivityTemplateDynamic>? chosenActivityTemplateList,
  }) {
    return ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpState(
      chosenActivityTemplateList:
          chosenActivityTemplateList ?? this.chosenActivityTemplateList,
    );
  }

  @override
  List<Object> get props => [chosenActivityTemplateList];
}
