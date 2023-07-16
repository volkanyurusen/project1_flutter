part of 'text_of_location_template_name_on_location_template_adding_pop_up_bloc.dart';

abstract class TextOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent
    extends Equatable {
  const TextOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfLocationTemplateNameOnLocationTemplateAddingPopUpSubmit
    extends TextOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextOfLocationTemplateNameOnLocationTemplateAddingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfLocationTemplateNameOnLocationTemplateAddingPopUpClear
    extends TextOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent {}
