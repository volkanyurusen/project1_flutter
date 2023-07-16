part of 'activity_type_dynamic_button_on_activity_template_updating_pop_up_bloc.dart';

abstract class ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpEvent
    extends Equatable {
  const ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpEvent();

  @override
  List<Object?> get props => [];
}

class PressActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp
    extends ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpEvent {
  final String activityTypeDynamic;

  const PressActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp({
    required this.activityTypeDynamic,
  });

  @override
  List<Object?> get props => [activityTypeDynamic];
}

class CleanActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp
    extends ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpEvent {}
