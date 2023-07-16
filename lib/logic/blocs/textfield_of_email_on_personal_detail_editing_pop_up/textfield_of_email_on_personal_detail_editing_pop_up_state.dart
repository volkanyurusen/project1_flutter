part of 'textfield_of_email_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextFieldOfEmailOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextFieldOfEmailOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfEmailOnPersonalDetailEditingPopUpState extends Equatable {
  final String? fieldText;
  final FormSubmissionOnEmailEditingState formSubmissionOnEmailEditingState;

  const TextFieldOfEmailOnPersonalDetailEditingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnEmailEditingState =
        const FormSubmissionOnEmailEditingState(),
  });

  TextFieldOfEmailOnPersonalDetailEditingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnEmailEditingState? formSubmissionOnEmailEditingState}) {
    return TextFieldOfEmailOnPersonalDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnEmailEditingState: formSubmissionOnEmailEditingState ??
          this.formSubmissionOnEmailEditingState,
    );
  }

  @override
  List<Object?> get props => [fieldText!, formSubmissionOnEmailEditingState];

  @override
  String toString() =>
      'TextFieldOfEmailOnPersonalDetailEditingPopUpState(fieldText: $fieldText, formSubmissionOnEmailEditingState.fieldTextError: ${formSubmissionOnEmailEditingState.fieldTextError}, formSubmissionOnEmailEditingState.isValid: ${formSubmissionOnEmailEditingState.isValid}, formSubmissionOnEmailEditingState.submissionSuccess: ${formSubmissionOnEmailEditingState.submissionSuccess}) ';
}
