part of 'activity_type_dynamic_button_on_activity_template_adding_pop_up_bloc.dart';

abstract class ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpEvent
    extends Equatable {
  const ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpEvent();

  @override
  List<Object?> get props => [];
}

class PressActivityTypeDynamicButtonOnActivityTemplateAddingPopUp
    extends ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpEvent {
  final String activityTypeDynamic;

  const PressActivityTypeDynamicButtonOnActivityTemplateAddingPopUp({
    required this.activityTypeDynamic,
  });

  @override
  List<Object?> get props => [activityTypeDynamic];
}

class CleanActivityTypeDynamicButtonOnActivityTemplateAddingPopUp
    extends ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpEvent {}
