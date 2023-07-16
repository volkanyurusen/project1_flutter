part of 'text_of_latitude_longitude_on_location_detail_location_template_adding_pop_up_bloc.dart';

// abstract class TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState extends Equatable {
//   const TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
    extends Equatable {
  final String? templateName;

  const TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState(
      {this.templateName = ''});

  TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState copyWith(
      {String? templateName}) {
    return TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState(
        templateName: templateName ?? this.templateName);
  }

  @override
  List<Object?> get props => [templateName!];

  @override
  String toString() =>
      'TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState(templateName: $templateName)';
}
