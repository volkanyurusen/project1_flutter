part of 'text_of_latitude_longitude_on_location_template_adding_pop_up_bloc.dart';

abstract class TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent
    extends Equatable {
  const TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpSubmit
    extends TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpClear
    extends TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent {}
