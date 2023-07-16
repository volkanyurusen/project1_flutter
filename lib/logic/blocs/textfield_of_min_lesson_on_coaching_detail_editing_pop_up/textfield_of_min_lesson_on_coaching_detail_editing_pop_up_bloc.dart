import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/form_submission_state.dart';

part 'textfield_of_min_lesson_on_coaching_detail_editing_pop_up_event.dart';
part 'textfield_of_min_lesson_on_coaching_detail_editing_pop_up_state.dart';

class TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc extends Bloc<
        TextFieldOfMinLessonOnCoachingDetailEditingPopUpEvent,
        TextFieldOfMinLessonOnCoachingDetailEditingPopUpState>
    with MinLessonValidationMixin {
  TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc()
      : super(TextFieldOfMinLessonOnCoachingDetailEditingPopUpState()) {
    on<TextFieldOfMinLessonOnCoachingDetailEditingPopUpSubmit>(
        _onTextFieldOfMinLessonOnCoachingDetailEditingPopUpEvent);
    on<TextFieldOfMinLessonOnCoachingDetailEditingPopUpClear>(
        _onTextFieldOfMinLessonOnCoachingDetailEditingPopUpClear);
    on<TextFieldOfMinLessonOnCoachingDetailEditingPopUpCompleted>(
        _onTextFieldOfMinLessonOnCoachingDetailEditingPopUpCompleted);
  }

  FutureOr<void> _onTextFieldOfMinLessonOnCoachingDetailEditingPopUpEvent(
      TextFieldOfMinLessonOnCoachingDetailEditingPopUpSubmit event,
      Emitter<TextFieldOfMinLessonOnCoachingDetailEditingPopUpState> emit) {
    // FIELD HAS ONLY ONE DIGIT
    if (hasFieldOnlyOneDigit(event.fieldText.toString())) {
      emit(state.copyWith(
          fieldText: '',
          formSubmissionOnMinLessonEditingState:
              const FormSubmissionOnMinLessonEditingState(
            isValid: false,
            fieldTextError: FieldError.empty,
            submissionSuccess: false,
            errorMessage: 'Please use between 1-9!!!',
          )));
      //
      // print('fieldText: ${event.fieldText.toString()}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
      // print('field is empty');
      // print('state is: ${state.toString()}');
      // FIELD IS TOO INVALID
    } else if (isExpCorrect(event.fieldText.toString()) == false) {
      emit(state.copyWith(
          fieldText: event.fieldText.toString(),
          formSubmissionOnMinLessonEditingState:
              const FormSubmissionOnMinLessonEditingState(
            isValid: false,
            fieldTextError: FieldError.invalid,
            submissionSuccess: false,
            errorMessage: 'Please use only numbers!!!',
          )));
      //
      // print('fieldText: ${event.fieldText.toString()}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
      // print('field is invalid');
      // print('state is: ${state.toString()}');
      // FIELD IS TOO SHORT
    } else if (isFieldTooSmall(event.fieldText.toString())) {
      emit(state.copyWith(
          fieldText: event.fieldText.toString(),
          formSubmissionOnMinLessonEditingState:
              const FormSubmissionOnMinLessonEditingState(
            isValid: false,
            fieldTextError: FieldError.short,
            submissionSuccess: false,
            errorMessage: 'Earlier then range!!!',
          )));
      //
      // print('fieldText: ${event.fieldText.toString()}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
      // print('field is too short');
      // print('state is: ${state.toString()}');
      // FIELD IS TOO LONG
    } else if (isFieldTooBig(event.fieldText.toString())) {
      emit(state.copyWith(
          fieldText: event.fieldText.toString(),
          formSubmissionOnMinLessonEditingState:
              const FormSubmissionOnMinLessonEditingState(
                  isValid: false,
                  fieldTextError: FieldError.long,
                  submissionSuccess: false,
                  errorMessage: 'Later then range')));
      //
      // print('fieldText: ${event.fieldText.toString()}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
      // print('field is too long');
      // print('state is: ${state.toString()}');
      // FIELD IS VALID
    } else {
      emit(state.copyWith(
          fieldText: event.fieldText.toString(),
          formSubmissionOnMinLessonEditingState:
              const FormSubmissionOnMinLessonEditingState(
                  submissionSuccess: false, isValid: true)));
      //
      // print('fieldText: ${event.fieldText.toString()}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
      // print('field is ok');
      // print('state is: ${state.toString()}');
    }
  }

  FutureOr<void> _onTextFieldOfMinLessonOnCoachingDetailEditingPopUpCompleted(
      TextFieldOfMinLessonOnCoachingDetailEditingPopUpCompleted event,
      Emitter<TextFieldOfMinLessonOnCoachingDetailEditingPopUpState> emit) {
    emit(state.copyWith(
        fieldText: event.fieldText.toString(),
        formSubmissionOnMinLessonEditingState:
            const FormSubmissionOnMinLessonEditingState(
                submissionSuccess: true, isValid: true)));
    //
    // print('fieldText: ${event.fieldText.toString()}');
    // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
    // print('field entered');
    // print('state is: ${state.toString()}');
  }

  FutureOr<void> _onTextFieldOfMinLessonOnCoachingDetailEditingPopUpClear(
      TextFieldOfMinLessonOnCoachingDetailEditingPopUpClear event,
      Emitter<TextFieldOfMinLessonOnCoachingDetailEditingPopUpState> emit) {
    emit(state.copyWith(
        fieldText: '',
        formSubmissionOnMinLessonEditingState:
            const FormSubmissionOnMinLessonEditingState(
                isValid: false, submissionSuccess: false)));
    //
    // print('field cleared');
    // print('state is: ${state.toString()}');
  }
}
