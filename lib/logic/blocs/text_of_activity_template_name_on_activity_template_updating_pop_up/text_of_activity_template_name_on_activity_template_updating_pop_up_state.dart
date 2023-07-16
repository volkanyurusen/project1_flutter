part of 'text_of_activity_template_name_on_activity_template_updating_pop_up_bloc.dart';

// abstract class TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState extends Equatable {
//   const TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState
    extends Equatable {
  final String? templateName;

  const TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState(
      {this.templateName = ''});

  TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState copyWith(
      {String? templateName}) {
    return TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState(
        templateName: templateName ?? this.templateName);
  }

  @override
  List<Object?> get props => [templateName!];

  @override
  String toString() =>
      'TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState(templateName: $templateName)';
}
