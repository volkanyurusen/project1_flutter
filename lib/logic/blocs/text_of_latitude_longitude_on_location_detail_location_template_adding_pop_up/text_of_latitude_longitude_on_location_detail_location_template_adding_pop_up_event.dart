part of 'text_of_latitude_longitude_on_location_detail_location_template_adding_pop_up_bloc.dart';

abstract class TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent
    extends Equatable {
  const TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpSubmit
    extends TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent {
  final String fieldText;

  const TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpClear
    extends TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent {}
