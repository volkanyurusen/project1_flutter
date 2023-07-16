part of 'text_of_location_template_name_on_location_detail_location_template_adding_pop_up_bloc.dart';

// abstract class TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState extends Equatable {
//   const TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
    extends Equatable {
  final String? templateName;

  const TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState(
      {this.templateName = ''});

  TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState copyWith(
      {String? templateName}) {
    return TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState(
        templateName: templateName ?? this.templateName);
  }

  @override
  List<Object?> get props => [templateName!];

  @override
  String toString() =>
      'TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState(templateName: $templateName)';
}
