part of 'text_of_activity_template_name_on_activity_template_adding_pop_up_bloc.dart';

// abstract class TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState extends Equatable {
//   const TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState
    extends Equatable {
  final String? templateName;

  const TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState(
      {this.templateName = ''});

  TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState copyWith(
      {String? templateName}) {
    return TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState(
        templateName: templateName ?? this.templateName);
  }

  @override
  List<Object?> get props => [templateName!];

  @override
  String toString() =>
      'TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState(templateName: $templateName)';
}
