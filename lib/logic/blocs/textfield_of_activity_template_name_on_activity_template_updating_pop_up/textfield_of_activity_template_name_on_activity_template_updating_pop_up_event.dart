part of 'textfield_of_activity_template_name_on_activity_template_updating_pop_up_bloc.dart';

abstract class TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent
    extends Equatable {
  const TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit
    extends TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent {
  final String fieldText;

  const TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpCompleted
    extends TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent {
  final String fieldText;

  const TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear
    extends TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent {}
