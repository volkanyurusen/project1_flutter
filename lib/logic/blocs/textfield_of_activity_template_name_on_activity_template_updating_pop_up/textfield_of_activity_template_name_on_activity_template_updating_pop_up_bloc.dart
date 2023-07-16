import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/form_submission_state.dart';

part 'textfield_of_activity_template_name_on_activity_template_updating_pop_up_event.dart';
part 'textfield_of_activity_template_name_on_activity_template_updating_pop_up_state.dart';

class TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc
    extends Bloc<
        TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent,
        TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>
    with TemplateNameValidationMixin {
  TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc()
      : super(
            TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState()) {
    on<TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit>(
        _onTextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent);
    on<TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear>(
        _onTextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear);
    on<TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpCompleted>(
        _onTextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpCompleted);
  }

  FutureOr<void>
      _onTextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent(
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit
              event,
          Emitter<TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>
              emit) {
    // BEGINNING STATE
    if (state.fieldText == '' &&
        state.formSubmissionOnActivityTemplateUpdatingState.fieldTextError ==
            null &&
        state.formSubmissionOnActivityTemplateUpdatingState.isValid == false &&
        state.formSubmissionOnActivityTemplateUpdatingState.submissionSuccess ==
            false) {
      emit(state.copyWith(
          fieldText: '',
          formSubmissionOnActivityTemplateUpdatingState:
              const FormSubmissionOnActivityTemplateUpdatingState(
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
          formSubmissionOnActivityTemplateUpdatingState:
              const FormSubmissionOnActivityTemplateUpdatingState(
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
          formSubmissionOnActivityTemplateUpdatingState:
              const FormSubmissionOnActivityTemplateUpdatingState(
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
          formSubmissionOnActivityTemplateUpdatingState:
              const FormSubmissionOnActivityTemplateUpdatingState(
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
          formSubmissionOnActivityTemplateUpdatingState:
              const FormSubmissionOnActivityTemplateUpdatingState(
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
          formSubmissionOnActivityTemplateUpdatingState:
              const FormSubmissionOnActivityTemplateUpdatingState(
                  submissionSuccess: false, isValid: true)));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is ok');
      // print('state is: ${state.toString()}');
    }
  }

  FutureOr<void>
      _onTextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpCompleted(
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpCompleted
              event,
          Emitter<TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>
              emit) {
    emit(state.copyWith(
        fieldText: event.fieldText,
        formSubmissionOnActivityTemplateUpdatingState:
            const FormSubmissionOnActivityTemplateUpdatingState(
                submissionSuccess: true, isValid: true)));
    //
    // print('fieldText: ${event.fieldText}');
    // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
    // print('field entered');
    // print('state is: ${state.toString()}');
  }

  FutureOr<void>
      _onTextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear(
          TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear
              event,
          Emitter<TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>
              emit) {
    emit(state.copyWith(
        fieldText: '',
        formSubmissionOnActivityTemplateUpdatingState:
            const FormSubmissionOnActivityTemplateUpdatingState(
                isValid: false, submissionSuccess: false)));
    //
    // print('field cleared');
    // print('state is: ${state.toString()}');
  }
}
