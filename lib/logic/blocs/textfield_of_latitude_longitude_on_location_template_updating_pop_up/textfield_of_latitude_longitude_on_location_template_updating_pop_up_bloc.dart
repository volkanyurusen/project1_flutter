import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/form_submission_state.dart';

part 'textfield_of_latitude_longitude_on_location_template_updating_pop_up_event.dart';
part 'textfield_of_latitude_longitude_on_location_template_updating_pop_up_state.dart';

class TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc
    extends Bloc<
        TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent,
        TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>
    with LatitudeLongitudeValidationMixin {
  TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc()
      : super(
            TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState()) {
    on<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit>(
        _onTextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent);
    on<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpClear>(
        _onTextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpClear);
    on<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpCompleted>(
        _onTextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpCompleted);
  }

  FutureOr<void>
      _onTextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent(
          TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit
              event,
          Emitter<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>
              emit) {
    // BEGINNING STATE
    if (state.fieldText == '' &&
        state.formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState
                .fieldTextError ==
            null &&
        state.formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState
                .isValid ==
            false &&
        state.formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState
                .submissionSuccess ==
            false) {
      emit(state.copyWith(
          fieldText: '',
          formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState(
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
          formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState(
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
          formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState(
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
          formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState(
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
          formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState(
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
          formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState:
              const FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState(
                  submissionSuccess: false, isValid: true)));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is ok');
      // print('state is: ${state.toString()}');
    }
  }

  FutureOr<void>
      _onTextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpCompleted(
          TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpCompleted
              event,
          Emitter<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>
              emit) {
    emit(state.copyWith(
        fieldText: event.fieldText,
        formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState:
            const FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState(
                submissionSuccess: true, isValid: true)));
    //
    // print('fieldText: ${event.fieldText}');
    // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
    // print('field entered');
    // print('state is: ${state.toString()}');
  }

  FutureOr<void>
      _onTextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpClear(
          TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpClear
              event,
          Emitter<TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>
              emit) {
    emit(state.copyWith(
        fieldText: '',
        formSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState:
            const FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState(
                isValid: false, submissionSuccess: false)));
    //
    // print('field cleared');
    // print('state is: ${state.toString()}');
  }
}
