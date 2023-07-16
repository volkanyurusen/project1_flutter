part of 'text_of_location_template_name_on_location_template_updating_pop_up_bloc.dart';

abstract class TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent
    extends Equatable {
  const TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit
    extends TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent {
  final String fieldText;

  const TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpClear
    extends TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent {}
