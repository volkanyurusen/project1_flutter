part of 'textfield_of_location_template_name_on_location_detail_location_template_adding_pop_up_bloc.dart';

// abstract class TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState extends Equatable {
//   const TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnLocationTemplateAddingState
      formSubmissionOnLocationTemplateAddingState;

  const TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnLocationTemplateAddingState =
        const FormSubmissionOnLocationTemplateAddingState(),
  });

  TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState
      copyWith(
          {String? fieldText,
          FormSubmissionOnLocationTemplateAddingState?
              formSubmissionOnLocationTemplateAddingState}) {
    return TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState(
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
      'TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState(fieldText: $fieldText, formSubmissionOnLocationTemplateAddingState.fieldTextError: ${formSubmissionOnLocationTemplateAddingState.fieldTextError}, formSubmissionOnLocationTemplateAddingState.isValid: ${formSubmissionOnLocationTemplateAddingState.isValid}, formSubmissionOnLocationTemplateAddingState.submissionSuccess: ${formSubmissionOnLocationTemplateAddingState.submissionSuccess}) ';
}
