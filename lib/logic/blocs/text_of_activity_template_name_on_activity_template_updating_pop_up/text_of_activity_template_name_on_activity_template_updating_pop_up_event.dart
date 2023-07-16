part of 'text_of_activity_template_name_on_activity_template_updating_pop_up_bloc.dart';

abstract class TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent
    extends Equatable {
  const TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit
    extends TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent {
  final String fieldText;

  const TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear
    extends TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent {}
