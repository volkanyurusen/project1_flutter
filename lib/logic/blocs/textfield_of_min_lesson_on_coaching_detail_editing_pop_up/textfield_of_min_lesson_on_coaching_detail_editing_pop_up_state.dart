part of 'textfield_of_min_lesson_on_coaching_detail_editing_pop_up_bloc.dart';

// abstract class TextFieldOfMinLessonOnCoachingDetailEditingPopUpState extends Equatable {
//   const TextFieldOfMinLessonOnCoachingDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextFieldOfMinLessonOnCoachingDetailEditingPopUpState extends Equatable {
  final String? fieldText;
  final FormSubmissionOnMinLessonEditingState
      formSubmissionOnMinLessonEditingState;

  const TextFieldOfMinLessonOnCoachingDetailEditingPopUpState({
    this.fieldText = '',
    this.formSubmissionOnMinLessonEditingState =
        const FormSubmissionOnMinLessonEditingState(),
  });

  TextFieldOfMinLessonOnCoachingDetailEditingPopUpState copyWith(
      {String? fieldText,
      FormSubmissionOnMinLessonEditingState?
          formSubmissionOnMinLessonEditingState}) {
    return TextFieldOfMinLessonOnCoachingDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
      formSubmissionOnMinLessonEditingState:
          formSubmissionOnMinLessonEditingState ??
              this.formSubmissionOnMinLessonEditingState,
    );
  }

  @override
  List<Object?> get props =>
      [fieldText!, formSubmissionOnMinLessonEditingState];

  @override
  String toString() =>
      'TextFieldOfMinLessonOnCoachingDetailEditingPopUpState(fieldText: $fieldText, formSubmissionOnMinLessonEditingState.fieldTextError: ${formSubmissionOnMinLessonEditingState.fieldTextError}, formSubmissionOnMinLessonEditingState.isValid: ${formSubmissionOnMinLessonEditingState.isValid}, formSubmissionOnMinLessonEditingState.submissionSuccess: ${formSubmissionOnMinLessonEditingState.submissionSuccess}) ';
}
