part of 'textfield_of_latitude_longitude_on_location_template_updating_pop_up_bloc.dart';

// abstract class TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState extends Equatable {
//   const TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState
      formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState;

  const TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState =
        const FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState(),
  });

  TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState?
          formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState}) {
    return TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState:
          formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState ??
              this.formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState,
    );
  }

  @override
  List<Object?> get props => [
        fieldText!,
        formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState
      ];

  @override
  String toString() =>
      'TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState(fieldText: $fieldText, formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState.fieldTextError: ${formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState.fieldTextError}, formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState.isValid: ${formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState.isValid}, formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState.submissionSuccess: ${formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState.submissionSuccess}) ';
}
