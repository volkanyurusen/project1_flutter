part of 'textfield_of_address_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextFieldOfAddressOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextFieldOfAddressOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfAddressOnPersonalDetailEditingPopUpState extends Equatable {
  final String? fieldText;
  final FormSubmissionOnAddressEditingState formSubmissionOnAddressEditingState;

  const TextFieldOfAddressOnPersonalDetailEditingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnAddressEditingState =
        const FormSubmissionOnAddressEditingState(),
  });

  TextFieldOfAddressOnPersonalDetailEditingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnAddressEditingState?
          formSubmissionOnAddressEditingState}) {
    return TextFieldOfAddressOnPersonalDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnAddressEditingState:
          formSubmissionOnAddressEditingState ??
              this.formSubmissionOnAddressEditingState,
    );
  }

  @override
  List<Object?> get props => [fieldText!, formSubmissionOnAddressEditingState];

  @override
  String toString() =>
      'TextFieldOfAddressOnPersonalDetailEditingPopUpState(fieldText: $fieldText, formSubmissionOnAddressEditingState.fieldTextError: ${formSubmissionOnAddressEditingState.fieldTextError}, formSubmissionOnAddressEditingState.isValid: ${formSubmissionOnAddressEditingState.isValid}, formSubmissionOnAddressEditingState.submissionSuccess: ${formSubmissionOnAddressEditingState.submissionSuccess}) ';
}
