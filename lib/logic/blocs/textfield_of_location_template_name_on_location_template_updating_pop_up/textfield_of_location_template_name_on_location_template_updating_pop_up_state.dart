part of 'textfield_of_location_template_name_on_location_template_updating_pop_up_bloc.dart';

// abstract class TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState extends Equatable {
//   const TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnLocationTemplateUpdatingState
      formSubmissionOnLocationTemplateUpdatingState;

  const TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnLocationTemplateUpdatingState =
        const FormSubmissionOnLocationTemplateUpdatingState(),
  });

  TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnLocationTemplateUpdatingState?
          formSubmissionOnLocationTemplateUpdatingState}) {
    return TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnLocationTemplateUpdatingState:
          formSubmissionOnLocationTemplateUpdatingState ??
              this.formSubmissionOnLocationTemplateUpdatingState,
    );
  }

  @override
  List<Object?> get props =>
      [fieldText!, formSubmissionOnLocationTemplateUpdatingState];

  @override
  String toString() =>
      'TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState(fieldText: $fieldText, formSubmissionOnLocationTemplateUpdatingState.fieldTextError: ${formSubmissionOnLocationTemplateUpdatingState.fieldTextError}, formSubmissionOnLocationTemplateUpdatingState.isValid: ${formSubmissionOnLocationTemplateUpdatingState.isValid}, formSubmissionOnLocationTemplateUpdatingState.submissionSuccess: ${formSubmissionOnLocationTemplateUpdatingState.submissionSuccess}) ';
}
