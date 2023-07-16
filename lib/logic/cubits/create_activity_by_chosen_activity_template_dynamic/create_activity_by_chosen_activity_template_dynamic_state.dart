part of 'create_activity_by_chosen_activity_template_dynamic_cubit.dart';

class CreateActivityByChosenActivityTemplateDynamicState extends Equatable {
  final List<ActivityTemplateDynamic> chosenActivityTemplateDynamicList;

  const CreateActivityByChosenActivityTemplateDynamicState({
    required this.chosenActivityTemplateDynamicList,
  });

  @override
  List<Object?> get props => [chosenActivityTemplateDynamicList];

  CreateActivityByChosenActivityTemplateDynamicState copyWith({
    List<ActivityTemplateDynamic>? chosenActivityTemplateDynamicList,
  }) {
    return CreateActivityByChosenActivityTemplateDynamicState(
      chosenActivityTemplateDynamicList: chosenActivityTemplateDynamicList ??
          this.chosenActivityTemplateDynamicList,
    );
  }

  @override
  String toString() =>
      'CreateActivityByChosenActivityTemplateDynamicState(chosenActivityTemplateDynamicList: $chosenActivityTemplateDynamicList)';
}
