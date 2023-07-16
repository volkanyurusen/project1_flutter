part of 'text_of_latitude_longitude_on_location_template_adding_pop_up_bloc.dart';

// abstract class TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState extends Equatable {
//   const TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState
    extends Equatable {
  final String? templateName;

  const TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState(
      {this.templateName = ''});

  TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState copyWith(
      {String? templateName}) {
    return TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState(
        templateName: templateName ?? this.templateName);
  }

  @override
  List<Object?> get props => [templateName!];

  @override
  String toString() =>
      'TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState(templateName: $templateName)';
}
