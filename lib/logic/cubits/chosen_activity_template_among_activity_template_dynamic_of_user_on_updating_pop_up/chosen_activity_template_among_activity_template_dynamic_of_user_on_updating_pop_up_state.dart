part of 'chosen_activity_template_among_activity_template_dynamic_of_user_on_updating_pop_up_cubit.dart';

class ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpState
    extends Equatable {
  final List<ActivityTemplateDynamic> chosenActivityTemplateList;

  const ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpState({
    required this.chosenActivityTemplateList,
  });

  ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpState
      copyWith({
    List<ActivityTemplateDynamic>? chosenActivityTemplateList,
  }) {
    return ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpState(
      chosenActivityTemplateList:
          chosenActivityTemplateList ?? this.chosenActivityTemplateList,
    );
  }

  @override
  List<Object> get props => [chosenActivityTemplateList];
}
