part of 'textfield_of_latitude_longitude_on_location_template_updating_pop_up_bloc.dart';

abstract class TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent
    extends Equatable {
  const TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit
    extends TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent {
  final String fieldText;

  const TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpCompleted
    extends TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent {
  final String fieldText;

  const TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpClear
    extends TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent {}
