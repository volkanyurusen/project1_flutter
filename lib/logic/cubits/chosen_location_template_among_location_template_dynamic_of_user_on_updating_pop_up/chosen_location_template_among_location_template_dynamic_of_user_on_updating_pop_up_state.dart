part of 'chosen_location_template_among_location_template_dynamic_of_user_on_updating_pop_up_cubit.dart';

class ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpState
    extends Equatable {
  final List<LocationTemplateDynamic> chosenLocationTemplateDynamicList;

  const ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpState({
    required this.chosenLocationTemplateDynamicList,
  });

  ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpState copyWith({
    List<LocationTemplateDynamic>? chosenLocationTemplateDynamicList,
  }) {
    return ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpState(
      chosenLocationTemplateDynamicList: chosenLocationTemplateDynamicList ??
          this.chosenLocationTemplateDynamicList,
    );
  }

  @override
  List<Object> get props => [chosenLocationTemplateDynamicList];
}
