part of 'text_of_latitude_longitude_on_location_template_updating_pop_up_bloc.dart';

abstract class TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent
    extends Equatable {
  const TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit
    extends TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent {
  final String fieldText;

  const TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpClear
    extends TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent {}
