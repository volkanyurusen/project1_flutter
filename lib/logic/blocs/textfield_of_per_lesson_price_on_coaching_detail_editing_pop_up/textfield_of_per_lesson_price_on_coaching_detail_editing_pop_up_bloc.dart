import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/form_submission_state.dart';

part 'textfield_of_per_lesson_price_on_coaching_detail_editing_pop_up_event.dart';
part 'textfield_of_per_lesson_price_on_coaching_detail_editing_pop_up_state.dart';

class TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc extends Bloc<
        TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpEvent,
        TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState>
    with PerLessonPriceValidationMixin {
  TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc()
      : super(TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState()) {
    on<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit>(
        _onTextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpEvent);
    on<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpClear>(
        _onTextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpClear);
    on<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpCompleted>(
        _onTextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpCompleted);
  }

  FutureOr<void> _onTextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpEvent(
      TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit event,
      Emitter<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState>
          emit) {
    // BEGINNING STATE
    if (hasFieldMaxDigit(event.fieldText.toString())) {
      emit(state.copyWith(
          fieldText: '',
          formSubmissionOnPerLessonPriceEditingState:
              const FormSubmissionOnPerLessonPriceEditingState(
            isValid: false,
            fieldTextError: FieldError.empty,
            submissionSuccess: false,
            errorMessage: 'Please use 4 digit!!!',
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
          formSubmissionOnPerLessonPriceEditingState:
              const FormSubmissionOnPerLessonPriceEditingState(
            isValid: false,
            fieldTextError: FieldError.invalid,
            submissionSuccess: false,
            errorMessage: 'Please use only numbers!!!',
          )));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText: ${event.fieldText.runtimeType}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
      // print('field is invalid');
      // print('state is: ${state.toString()}');
      // FIELD IS TOO SHORT
    } else if (isFieldTooSmall(event.fieldText.toString())) {
      emit(state.copyWith(
          fieldText: event.fieldText.toString(),
          formSubmissionOnPerLessonPriceEditingState:
              const FormSubmissionOnPerLessonPriceEditingState(
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
          formSubmissionOnPerLessonPriceEditingState:
              const FormSubmissionOnPerLessonPriceEditingState(
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
          formSubmissionOnPerLessonPriceEditingState:
              const FormSubmissionOnPerLessonPriceEditingState(
                  submissionSuccess: false, isValid: true)));
      //
      // print('fieldText: ${event.fieldText.toString()}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
      // print('field is ok');
      // print('state is: ${state.toString()}');
    }
  }

  FutureOr<void>
      _onTextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpCompleted(
          TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpCompleted event,
          Emitter<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState>
              emit) {
    emit(state.copyWith(
        fieldText: event.fieldText.toString(),
        formSubmissionOnPerLessonPriceEditingState:
            const FormSubmissionOnPerLessonPriceEditingState(
                submissionSuccess: true, isValid: true)));
    //
    // print('fieldText: ${event.fieldText.toString()}');
    // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
    // print('field entered');
    // print('state is: ${state.toString()}');
  }

  FutureOr<void> _onTextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpClear(
      TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpClear event,
      Emitter<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpState>
          emit) {
    emit(state.copyWith(
        fieldText: '',
        formSubmissionOnPerLessonPriceEditingState:
            const FormSubmissionOnPerLessonPriceEditingState(
                isValid: false, submissionSuccess: false)));
    //
    // print('field cleared');
    // print('state is: ${state.toString()}');
  }
}
