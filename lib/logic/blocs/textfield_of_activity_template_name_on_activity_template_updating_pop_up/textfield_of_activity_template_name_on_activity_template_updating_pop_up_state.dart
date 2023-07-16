part of 'textfield_of_activity_template_name_on_activity_template_updating_pop_up_bloc.dart';

// abstract class TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState extends Equatable {
//   const TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnActivityTemplateUpdatingState
      formSubmissionOnActivityTemplateUpdatingState;

  const TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnActivityTemplateUpdatingState =
        const FormSubmissionOnActivityTemplateUpdatingState(),
  });

  TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnActivityTemplateUpdatingState?
          formSubmissionOnActivityTemplateUpdatingState}) {
    return TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnActivityTemplateUpdatingState:
          formSubmissionOnActivityTemplateUpdatingState ??
              this.formSubmissionOnActivityTemplateUpdatingState,
    );
  }

  @override
  List<Object?> get props =>
      [fieldText!, formSubmissionOnActivityTemplateUpdatingState];

  @override
  String toString() =>
      'TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState(fieldText: $fieldText, formSubmissionOnActivityTemplateUpdatingState.fieldTextError: ${formSubmissionOnActivityTemplateUpdatingState.fieldTextError}, formSubmissionOnActivityTemplateUpdatingState.isValid: ${formSubmissionOnActivityTemplateUpdatingState.isValid}, formSubmissionOnActivityTemplateUpdatingState.submissionSuccess: ${formSubmissionOnActivityTemplateUpdatingState.submissionSuccess}) ';
}
