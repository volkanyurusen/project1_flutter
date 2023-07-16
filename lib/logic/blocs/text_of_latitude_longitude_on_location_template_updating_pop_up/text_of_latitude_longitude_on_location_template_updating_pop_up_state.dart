part of 'text_of_latitude_longitude_on_location_template_updating_pop_up_bloc.dart';

// abstract class TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState extends Equatable {
//   const TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState
    extends Equatable {
  final String? templateName;

  const TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState(
      {this.templateName = ''});

  TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState copyWith(
      {String? templateName}) {
    return TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState(
        templateName: templateName ?? this.templateName);
  }

  @override
  List<Object?> get props => [templateName!];

  @override
  String toString() =>
      'TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState(templateName: $templateName)';
}
