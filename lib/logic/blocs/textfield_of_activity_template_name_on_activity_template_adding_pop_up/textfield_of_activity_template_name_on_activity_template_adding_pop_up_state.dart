part of 'textfield_of_activity_template_name_on_activity_template_adding_pop_up_bloc.dart';

// abstract class TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpState extends Equatable {
//   const TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnActivityTemplateAddingState
      formSubmissionOnActivityTemplateAddingState;

  const TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnActivityTemplateAddingState =
        const FormSubmissionOnActivityTemplateAddingState(),
  });

  TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnActivityTemplateAddingState?
          formSubmissionOnActivityTemplateAddingState}) {
    return TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnActivityTemplateAddingState:
          formSubmissionOnActivityTemplateAddingState ??
              this.formSubmissionOnActivityTemplateAddingState,
    );
  }

  @override
  List<Object?> get props =>
      [fieldText!, formSubmissionOnActivityTemplateAddingState];

  @override
  String toString() =>
      'TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpState(fieldText: $fieldText, formSubmissionOnActivityTemplateAddingState.fieldTextError: ${formSubmissionOnActivityTemplateAddingState.fieldTextError}, formSubmissionOnActivityTemplateAddingState.isValid: ${formSubmissionOnActivityTemplateAddingState.isValid}, formSubmissionOnActivityTemplateAddingState.submissionSuccess: ${formSubmissionOnActivityTemplateAddingState.submissionSuccess}) ';
}
