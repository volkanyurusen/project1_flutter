part of 'text_of_location_template_name_on_location_detail_location_template_adding_pop_up_bloc.dart';

abstract class TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent
    extends Equatable {
  const TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpSubmit
    extends TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpSubmit(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpClear
    extends TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent {}
