part of 'textfield_of_location_template_name_on_location_template_updating_pop_up_bloc.dart';

abstract class TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent
    extends Equatable {
  const TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit
    extends TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent {
  final String fieldText;

  const TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpCompleted
    extends TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent {
  final String fieldText;

  const TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpClear
    extends TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent {}
