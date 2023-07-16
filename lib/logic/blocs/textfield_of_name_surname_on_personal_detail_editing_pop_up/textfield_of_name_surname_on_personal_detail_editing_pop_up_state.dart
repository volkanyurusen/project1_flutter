part of 'textfield_of_name_surname_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnNameSurnameEditingState
      formSubmissionOnNameSurnameEditingState;

  const TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnNameSurnameEditingState =
        const FormSubmissionOnNameSurnameEditingState(),
  });

  TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnNameSurnameEditingState?
          formSubmissionOnNameSurnameEditingState}) {
    return TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnNameSurnameEditingState:
          formSubmissionOnNameSurnameEditingState ??
              this.formSubmissionOnNameSurnameEditingState,
    );
  }

  @override
  List<Object?> get props =>
      [fieldText!, formSubmissionOnNameSurnameEditingState];

  @override
  String toString() =>
      'TextFieldOfNameSurnameOnPersonalDetailEditingPopUpState(fieldText: $fieldText, formSubmissionOnNameSurnameEditingState.fieldTextError: ${formSubmissionOnNameSurnameEditingState.fieldTextError}, formSubmissionOnNameSurnameEditingState.isValid: ${formSubmissionOnNameSurnameEditingState.isValid}, formSubmissionOnNameSurnameEditingState.submissionSuccess: ${formSubmissionOnNameSurnameEditingState.submissionSuccess}) ';
}
