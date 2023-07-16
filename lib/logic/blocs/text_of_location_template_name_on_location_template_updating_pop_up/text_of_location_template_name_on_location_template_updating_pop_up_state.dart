part of 'text_of_location_template_name_on_location_template_updating_pop_up_bloc.dart';

// abstract class TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState extends Equatable {
//   const TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState
    extends Equatable {
  final String? templateName;

  const TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState(
      {this.templateName = ''});

  TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState copyWith(
      {String? templateName}) {
    return TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState(
        templateName: templateName ?? this.templateName);
  }

  @override
  List<Object?> get props => [templateName!];

  @override
  String toString() =>
      'TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState(templateName: $templateName)';
}
