part of 'textfield_of_latitude_longitude_on_location_detail_location_template_adding_pop_up_bloc.dart';

abstract class TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent
    extends Equatable {
  const TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpSubmit
    extends TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpCompleted
    extends TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpClear
    extends TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent {}
