part of 'textfield_of_birthyear_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextFieldOfBirthyearOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextFieldOfBirthyearOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfBirthyearOnPersonalDetailEditingPopUpState extends Equatable {
  final String? fieldText;
  final FormSubmissionOnBirthyearEditingState
      formSubmissionOnBirthyearEditingState;

  const TextFieldOfBirthyearOnPersonalDetailEditingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnBirthyearEditingState =
        const FormSubmissionOnBirthyearEditingState(),
  });

  TextFieldOfBirthyearOnPersonalDetailEditingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnBirthyearEditingState?
          formSubmissionOnBirthyearEditingState}) {
    return TextFieldOfBirthyearOnPersonalDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnBirthyearEditingState:
          formSubmissionOnBirthyearEditingState ??
              this.formSubmissionOnBirthyearEditingState,
    );
  }

  @override
  List<Object?> get props =>
      [fieldText!, formSubmissionOnBirthyearEditingState];

  @override
  String toString() =>
      'TextFieldOfBirthyearOnPersonalDetailEditingPopUpState(fieldText: $fieldText, formSubmissionOnBirthyearEditingState.fieldTextError: ${formSubmissionOnBirthyearEditingState.fieldTextError}, formSubmissionOnBirthyearEditingState.isValid: ${formSubmissionOnBirthyearEditingState.isValid}, formSubmissionOnBirthyearEditingState.submissionSuccess: ${formSubmissionOnBirthyearEditingState.submissionSuccess}) ';
}
