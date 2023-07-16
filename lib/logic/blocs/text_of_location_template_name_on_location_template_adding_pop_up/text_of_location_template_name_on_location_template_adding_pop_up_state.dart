part of 'text_of_location_template_name_on_location_template_adding_pop_up_bloc.dart';

// abstract class TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState extends Equatable {
//   const TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState
    extends Equatable {
  final String? templateName;

  const TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState(
      {this.templateName = ''});

  TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState copyWith(
      {String? templateName}) {
    return TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState(
        templateName: templateName ?? this.templateName);
  }

  @override
  List<Object?> get props => [templateName!];

  @override
  String toString() =>
      'TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState(templateName: $templateName)';
}
