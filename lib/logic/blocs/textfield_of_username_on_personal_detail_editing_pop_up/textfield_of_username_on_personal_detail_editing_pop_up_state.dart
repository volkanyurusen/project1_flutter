part of 'textfield_of_username_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextFieldOfUsernameOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextFieldOfUsernameOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfUsernameOnPersonalDetailEditingPopUpState extends Equatable {
  final String? fieldText;
  final FormSubmissionOnUsernameEditingState
      formSubmissionOnUsernameEditingState;

  const TextFieldOfUsernameOnPersonalDetailEditingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnUsernameEditingState =
        const FormSubmissionOnUsernameEditingState(),
  });

  TextFieldOfUsernameOnPersonalDetailEditingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnUsernameEditingState?
          formSubmissionOnUsernameEditingState}) {
    return TextFieldOfUsernameOnPersonalDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnUsernameEditingState:
          formSubmissionOnUsernameEditingState ??
              this.formSubmissionOnUsernameEditingState,
    );
  }

  @override
  List<Object?> get props => [fieldText!, formSubmissionOnUsernameEditingState];

  @override
  String toString() =>
      'TextFieldOfUsernameOnPersonalDetailEditingPopUpState(fieldText: $fieldText, formSubmissionOnUsernameEditingState.fieldTextError: ${formSubmissionOnUsernameEditingState.fieldTextError}, formSubmissionOnUsernameEditingState.isValid: ${formSubmissionOnUsernameEditingState.isValid}, formSubmissionOnUsernameEditingState.submissionSuccess: ${formSubmissionOnUsernameEditingState.submissionSuccess}) ';
}
