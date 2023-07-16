part of 'textfield_of_activity_template_name_on_activity_template_adding_pop_up_bloc.dart';

abstract class TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent
    extends Equatable {
  const TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpSubmit
    extends TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent {
  final String fieldText;

  const TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpCompleted
    extends TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent {
  final String fieldText;

  const TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpCompleted(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpClear
    extends TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent {}
