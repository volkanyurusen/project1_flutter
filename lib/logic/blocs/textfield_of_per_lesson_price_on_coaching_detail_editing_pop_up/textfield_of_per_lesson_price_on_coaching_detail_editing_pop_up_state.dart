part of 'textfield_of_per_lesson_price_on_coaching_detail_editing_pop_up_bloc.dart';

// abstract class TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState extends Equatable {
//   const TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState
    extends Equatable {
  final String? fieldText;
  final FormSubmissionOnPerLessonPriceEditingState
      formSubmissionOnPerLessonPriceEditingState;

  const TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnPerLessonPriceEditingState =
        const FormSubmissionOnPerLessonPriceEditingState(),
  });

  TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnPerLessonPriceEditingState?
          formSubmissionOnPerLessonPriceEditingState}) {
    return TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnPerLessonPriceEditingState:
          formSubmissionOnPerLessonPriceEditingState ??
              this.formSubmissionOnPerLessonPriceEditingState,
    );
  }

  @override
  List<Object?> get props =>
      [fieldText!, formSubmissionOnPerLessonPriceEditingState];

  @override
  String toString() =>
      'TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState(fieldText: $fieldText, formSubmissionOnPerLessonPriceEditingState.fieldTextError: ${formSubmissionOnPerLessonPriceEditingState.fieldTextError}, formSubmissionOnPerLessonPriceEditingState.isValid: ${formSubmissionOnPerLessonPriceEditingState.isValid}, formSubmissionOnPerLessonPriceEditingState.submissionSuccess: ${formSubmissionOnPerLessonPriceEditingState.submissionSuccess}) ';
}
