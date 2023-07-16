import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/form_submission_state.dart';

part 'textfield_of_latitude_longitude_on_location_template_adding_pop_up_event.dart';
part 'textfield_of_latitude_longitude_on_location_template_adding_pop_up_state.dart';

class TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc
    extends Bloc<TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent,
        TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState>
    with LatitudeLongitudeValidationMixin {
  TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc()
      : super(
            TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState()) {
    on<TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpSubmit>(
        _onTextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent);
    on<TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpClear>(
        _onTextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpClear);
    on<TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpCompleted>(
        _onTextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpCompleted);
  }

  FutureOr<void>
      _onTextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent(
          TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpSubmit event,
          Emitter<TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState>
              emit) {
    // BEGINNING STATE
    if (state.fieldText == '' &&
        state.formSubmissionOnLocationTemplateLatitudeLongitudeAddingState
                .fieldTextError ==
            null &&
        state.formSubmissionOnLocationTemplateLatitudeLongitudeAddingState
                .isValid ==
            false &&
        state.formSubmissionOnLocationTemplateLatitudeLongitudeAddingState
                .submissionSuccess ==
            false) {
      emit(state.copyWith(
          fieldText: '',
          formSubmissionOnLocationTemplateLatitudeLongitudeAddingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(
            isValid: false,
            fieldTextError: FieldError.empty,
            submissionSuccess: false,
            errorMessage: 'Field cannot be stayed empty!!!',
          )));
      //
      // print('fieldText: ${event.fieldText}');
      // print('name validation: ${validateTemplateName(event.fieldText)}');
      // print('field is beginning state');
      // print('state is: ${state.toString()}');
      // FIELD IS EMPTY
    } else if (isFieldEmpty(event.fieldText) || isFieldNull(event.fieldText)) {
      emit(state.copyWith(
          fieldText: '',
          formSubmissionOnLocationTemplateLatitudeLongitudeAddingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(
            isValid: false,
            fieldTextError: FieldError.empty,
            submissionSuccess: false,
            errorMessage: 'Field cannot be stayed empty!!!',
          )));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is empty');
      // print('state is: ${state.toString()}');
      // FIELD IS TOO INVALID
    } else if (isExpCorrect(event.fieldText) == false) {
      emit(state.copyWith(
          fieldText: event.fieldText,
          formSubmissionOnLocationTemplateLatitudeLongitudeAddingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(
            isValid: false,
            fieldTextError: FieldError.invalid,
            submissionSuccess: false,
            errorMessage: 'Please use only letters and numbers!!!',
          )));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is invalid');
      // print('state is: ${state.toString()}');
      // FIELD IS TOO SHORT
    } else if (isFieldTooShort(event.fieldText)) {
      emit(state.copyWith(
          fieldText: event.fieldText,
          formSubmissionOnLocationTemplateLatitudeLongitudeAddingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(
            isValid: false,
            fieldTextError: FieldError.short,
            submissionSuccess: false,
            errorMessage: 'Template must be min 3 letters/numbers!!!',
          )));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is too short');
      // print('state is: ${state.toString()}');
      // FIELD IS TOO LONG
    } else if (isFieldTooLong(event.fieldText)) {
      emit(state.copyWith(
          fieldText: event.fieldText,
          formSubmissionOnLocationTemplateLatitudeLongitudeAddingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(
                  isValid: false,
                  fieldTextError: FieldError.long,
                  submissionSuccess: false,
                  errorMessage: 'Template must be max 30 letters/numbers!!!')));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is too long');
      // print('state is: ${state.toString()}');
      // FIELD IS VALID
    } else {
      emit(state.copyWith(
          fieldText: event.fieldText,
          formSubmissionOnLocationTemplateLatitudeLongitudeAddingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(
                  submissionSuccess: false, isValid: true)));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is ok');
      // print('state is: ${state.toString()}');
    }
  }

  FutureOr<void>
      _onTextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpCompleted(
          TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpCompleted
              event,
          Emitter<TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState>
              emit) {
    emit(state.copyWith(
        fieldText: event.fieldText,
        formSubmissionOnLocationTemplateLatitudeLongitudeAddingState:
            const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(
                submissionSuccess: true, isValid: true)));
    //
    // print('fieldText: ${event.fieldText}');
    // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
    // print('field entered');
    // print('state is: ${state.toString()}');
  }

  FutureOr<void>
      _onTextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpClear(
          TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpClear event,
          Emitter<TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpState>
              emit) {
    emit(state.copyWith(
        fieldText: '',
        formSubmissionOnLocationTemplateLatitudeLongitudeAddingState:
            const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(
                isValid: false, submissionSuccess: false)));
    //
    // print('field cleared');
    // print('state is: ${state.toString()}');
  }
}
