part of 'textfield_of_about_yourself_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnAboutYourselfEditingState
      formSubmissionOnAboutYourselfEditingState;

  const TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnAboutYourselfEditingState =
        const FormSubmissionOnAboutYourselfEditingState(),
  });

  TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnAboutYourselfEditingState?
          formSubmissionOnAboutYourselfEditingState}) {
    return TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnAboutYourselfEditingState:
          formSubmissionOnAboutYourselfEditingState ??
              this.formSubmissionOnAboutYourselfEditingState,
    );
  }

  @override
  List<Object?> get props =>
      [fieldText!, formSubmissionOnAboutYourselfEditingState];

  @override
  String toString() =>
      'TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpState(fieldText: $fieldText, formSubmissionOnAboutYourselfEditingState.fieldTextError: ${formSubmissionOnAboutYourselfEditingState.fieldTextError}, formSubmissionOnAboutYourselfEditingState.isValid: ${formSubmissionOnAboutYourselfEditingState.isValid}, formSubmissionOnAboutYourselfEditingState.submissionSuccess: ${formSubmissionOnAboutYourselfEditingState.submissionSuccess}) ';
}
