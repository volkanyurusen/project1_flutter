import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/form_submission_state.dart';

part 'textfield_of_email_on_personal_detail_editing_pop_up_event.dart';
part 'textfield_of_email_on_personal_detail_editing_pop_up_state.dart';

class TextFieldOfEmailOnPersonalDetailEditingPopUpBloc extends Bloc<
        TextFieldOfEmailOnPersonalDetailEditingPopUpEvent,
        TextFieldOfEmailOnPersonalDetailEditingPopUpState>
    with EmailValidationMixin {
  TextFieldOfEmailOnPersonalDetailEditingPopUpBloc()
      : super(TextFieldOfEmailOnPersonalDetailEditingPopUpState()) {
    on<TextFieldOfEmailOnPersonalDetailEditingPopUpSubmit>(
        _onTextFieldOfEmailOnPersonalDetailEditingPopUpEvent);
    on<TextFieldOfEmailOnPersonalDetailEditingPopUpClear>(
        _onTextFieldOfEmailOnPersonalDetailEditingPopUpClear);
    on<TextFieldOfEmailOnPersonalDetailEditingPopUpCompleted>(
        _onTextFieldOfEmailOnPersonalDetailEditingPopUpCompleted);
  }

  FutureOr<void> _onTextFieldOfEmailOnPersonalDetailEditingPopUpEvent(
      TextFieldOfEmailOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextFieldOfEmailOnPersonalDetailEditingPopUpState> emit) {
    // BEGINNING STATE
    if (state.fieldText == '' &&
        state.formSubmissionOnEmailEditingState.fieldTextError == null &&
        state.formSubmissionOnEmailEditingState.isValid == false &&
        state.formSubmissionOnEmailEditingState.submissionSuccess == false) {
      emit(state.copyWith(
          fieldText: '',
          formSubmissionOnEmailEditingState:
              const FormSubmissionOnEmailEditingState(
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
          formSubmissionOnEmailEditingState:
              const FormSubmissionOnEmailEditingState(
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
          formSubmissionOnEmailEditingState:
              const FormSubmissionOnEmailEditingState(
            isValid: false,
            fieldTextError: FieldError.invalid,
            submissionSuccess: false,
            errorMessage: 'Please enter valid email address!!!',
          )));
      //   //
      //   print('fieldText: ${event.fieldText}');
      //   print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      //   print('field is invalid');
      //   print('state is: ${state.toString()}');
      // FIELD IS TOO SHORT
      // } else if (isFieldTooShort(event.fieldText)) {
      //   emit(state.copyWith(
      //       fieldText: event.fieldText,
      //       formSubmissionOnEmailEditingState:
      //           const FormSubmissionOnEmailEditingState(
      //         isValid: false,
      //         fieldTextError: FieldError.short,
      //         submissionSuccess: false,
      //         errorMessage: 'Template must be min 3 letters/numbers!!!',
      //       )));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is too short');
      // print('state is: ${state.toString()}');
      // FIELD IS TOO LONG
    } else if (isFieldTooLong(event.fieldText)) {
      emit(state.copyWith(
          fieldText: event.fieldText,
          formSubmissionOnEmailEditingState:
              const FormSubmissionOnEmailEditingState(
                  isValid: false,
                  fieldTextError: FieldError.long,
                  submissionSuccess: false,
                  errorMessage: 'Template must be max 75 letters/numbers!!!')));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is too long');
      // print('state is: ${state.toString()}');
      // FIELD IS TOO LONG
      // } else if (validateEmail(event.fieldText)) {
      //   emit(state.copyWith(
      //       fieldText: event.fieldText,
      //       formSubmissionOnEmailEditingState:
      //           const FormSubmissionOnEmailEditingState(
      //               isValid: false,
      //               fieldTextError: FieldError.long,
      //               submissionSuccess: false,
      //               errorMessage: 'Please choose ')));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is too long');
      // print('state is: ${state.toString()}');
      // FIELD IS VALID
    } else {
      emit(state.copyWith(
          fieldText: event.fieldText,
          formSubmissionOnEmailEditingState:
              const FormSubmissionOnEmailEditingState(
                  submissionSuccess: false, isValid: true)));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is ok');
      // print('state is: ${state.toString()}');
    }
  }

  FutureOr<void> _onTextFieldOfEmailOnPersonalDetailEditingPopUpCompleted(
      TextFieldOfEmailOnPersonalDetailEditingPopUpCompleted event,
      Emitter<TextFieldOfEmailOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(
        fieldText: event.fieldText,
        formSubmissionOnEmailEditingState:
            const FormSubmissionOnEmailEditingState(
                submissionSuccess: true, isValid: true)));
    //
    // print('fieldText: ${event.fieldText}');
    // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
    // print('field entered');
    // print('state is: ${state.toString()}');
  }

  FutureOr<void> _onTextFieldOfEmailOnPersonalDetailEditingPopUpClear(
      TextFieldOfEmailOnPersonalDetailEditingPopUpClear event,
      Emitter<TextFieldOfEmailOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(
        fieldText: '',
        formSubmissionOnEmailEditingState:
            const FormSubmissionOnEmailEditingState(
                isValid: false, submissionSuccess: false)));
    //
    // print('field cleared');
    // print('state is: ${state.toString()}');
  }
}
