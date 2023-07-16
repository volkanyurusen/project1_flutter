part of 'textfield_of_latitude_longitude_on_location_template_adding_pop_up_bloc.dart';

// abstract class TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState extends Equatable {
//   const TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState
      formSubmissionOnLocationTemplateLatitudeLongitudeAddingState;

  const TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnLocationTemplateLatitudeLongitudeAddingState =
        const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(),
  });

  TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState?
          formSubmissionOnLocationTemplateLatitudeLongitudeAddingState}) {
    return TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnLocationTemplateLatitudeLongitudeAddingState:
          formSubmissionOnLocationTemplateLatitudeLongitudeAddingState ??
              this.formSubmissionOnLocationTemplateLatitudeLongitudeAddingState,
    );
  }

  @override
  List<Object?> get props => [
        fieldText!,
        formSubmissionOnLocationTemplateLatitudeLongitudeAddingState
      ];

  @override
  String toString() =>
      'TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState(fieldText: $fieldText, formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.fieldTextError: ${formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.fieldTextError}, formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.isValid: ${formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.isValid}, formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.submissionSuccess: ${formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.submissionSuccess}) ';
}
