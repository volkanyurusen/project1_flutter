part of 'textfield_of_location_template_name_on_location_template_adding_pop_up_bloc.dart';

abstract class TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent
    extends Equatable {
  const TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpSubmit
    extends TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpCompleted
    extends TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpClear
    extends TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent {}
