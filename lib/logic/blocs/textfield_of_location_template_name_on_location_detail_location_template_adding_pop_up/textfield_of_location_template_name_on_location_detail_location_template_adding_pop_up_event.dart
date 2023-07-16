part of 'textfield_of_location_template_name_on_location_detail_location_template_adding_pop_up_bloc.dart';

abstract class TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent
    extends Equatable {
  const TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpSubmit
    extends TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpCompleted
    extends TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpClear
    extends TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent {}
