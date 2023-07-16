part of 'text_of_activity_template_name_on_activity_template_adding_pop_up_bloc.dart';

abstract class TextOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent
    extends Equatable {
  const TextOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfActivityTemplateNameOnActivityTemplateAddingPopUpSubmit
    extends TextOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent {
  final String fieldText;

  const TextOfActivityTemplateNameOnActivityTemplateAddingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfActivityTemplateNameOnActivityTemplateAddingPopUpClear
    extends TextOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent {}
