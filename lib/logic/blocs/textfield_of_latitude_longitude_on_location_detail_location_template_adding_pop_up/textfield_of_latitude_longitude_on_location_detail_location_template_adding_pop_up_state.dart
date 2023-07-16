part of 'textfield_of_latitude_longitude_on_location_detail_location_template_adding_pop_up_bloc.dart';

// abstract class TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState extends Equatable {
//   const TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState
      formSubmissionOnLocationTemplateLatitudeLongitudeAddingState;

  const TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnLocationTemplateLatitudeLongitudeAddingState =
        const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(),
  });

  TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState?
          formSubmissionOnLocationTemplateLatitudeLongitudeAddingState}) {
    return TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState(
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
      'TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState(fieldText: $fieldText, formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.fieldTextError: ${formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.fieldTextError}, formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.isValid: ${formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.isValid}, formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.submissionSuccess: ${formSubmissionOnLocationTemplateLatitudeLongitudeAddingState.submissionSuccess}) ';
}
