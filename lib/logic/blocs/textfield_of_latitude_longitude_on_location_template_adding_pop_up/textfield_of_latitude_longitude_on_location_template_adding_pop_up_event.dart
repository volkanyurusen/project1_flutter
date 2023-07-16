part of 'textfield_of_latitude_longitude_on_location_template_adding_pop_up_bloc.dart';

abstract class TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent
    extends Equatable {
  const TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpSubmit
    extends TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpCompleted
    extends TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpClear
    extends TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent {}
