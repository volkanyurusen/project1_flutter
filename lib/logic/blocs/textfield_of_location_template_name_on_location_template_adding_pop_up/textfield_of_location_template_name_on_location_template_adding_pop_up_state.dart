part of 'textfield_of_location_template_name_on_location_template_adding_pop_up_bloc.dart';

// abstract class TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState extends Equatable {
//   const TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnLocationTemplateAddingState
      formSubmissionOnLocationTemplateAddingState;

  const TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnLocationTemplateAddingState =
        const FormSubmissionOnLocationTemplateAddingState(),
  });

  TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnLocationTemplateAddingState?
          formSubmissionOnLocationTemplateAddingState}) {
    return TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnLocationTemplateAddingState:
          formSubmissionOnLocationTemplateAddingState ??
              this.formSubmissionOnLocationTemplateAddingState,
    );
  }

  @override
  List<Object?> get props =>
      [fieldText!, formSubmissionOnLocationTemplateAddingState];

  @override
  String toString() =>
      'TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpState(fieldText: $fieldText, formSubmissionOnLocationTemplateAddingState.fieldTextError: ${formSubmissionOnLocationTemplateAddingState.fieldTextError}, formSubmissionOnLocationTemplateAddingState.isValid: ${formSubmissionOnLocationTemplateAddingState.isValid}, formSubmissionOnLocationTemplateAddingState.submissionSuccess: ${formSubmissionOnLocationTemplateAddingState.submissionSuccess}) ';
}
