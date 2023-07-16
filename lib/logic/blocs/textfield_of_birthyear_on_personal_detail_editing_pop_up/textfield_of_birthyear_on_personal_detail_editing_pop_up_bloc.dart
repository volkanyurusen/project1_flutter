import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/form_submission_state.dart';

part 'textfield_of_birthyear_on_personal_detail_editing_pop_up_event.dart';
part 'textfield_of_birthyear_on_personal_detail_editing_pop_up_state.dart';

class TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc extends Bloc<
        TextFieldOfBirthyearOnPersonalDetailEditingPopUpEvent,
        TextFieldOfBirthyearOnPersonalDetailEditingPopUpState>
    with BirthyearValidationMixin {
  TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc()
      : super(TextFieldOfBirthyearOnPersonalDetailEditingPopUpState()) {
    on<TextFieldOfBirthyearOnPersonalDetailEditingPopUpSubmit>(
        _onTextFieldOfBirthyearOnPersonalDetailEditingPopUpEvent);
    on<TextFieldOfBirthyearOnPersonalDetailEditingPopUpClear>(
        _onTextFieldOfBirthyearOnPersonalDetailEditingPopUpClear);
    on<TextFieldOfBirthyearOnPersonalDetailEditingPopUpCompleted>(
        _onTextFieldOfBirthyearOnPersonalDetailEditingPopUpCompleted);
  }

  FutureOr<void> _onTextFieldOfBirthyearOnPersonalDetailEditingPopUpEvent(
      TextFieldOfBirthyearOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextFieldOfBirthyearOnPersonalDetailEditingPopUpState> emit) {
    // BEGINNING STATE
    if (hasFieldFourDigit(event.fieldText.toString())) {
      emit(state.copyWith(
          fieldText: '',
          formSubmissionOnBirthyearEditingState:
              const FormSubmissionOnBirthyearEditingState(
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
          formSubmissionOnBirthyearEditingState:
              const FormSubmissionOnBirthyearEditingState(
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
    } else if (isFieldTooEarly(event.fieldText.toString())) {
      emit(state.copyWith(
          fieldText: event.fieldText.toString(),
          formSubmissionOnBirthyearEditingState:
              const FormSubmissionOnBirthyearEditingState(
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
    } else if (isFieldTooLate(event.fieldText.toString())) {
      emit(state.copyWith(
          fieldText: event.fieldText.toString(),
          formSubmissionOnBirthyearEditingState:
              const FormSubmissionOnBirthyearEditingState(
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
          formSubmissionOnBirthyearEditingState:
              const FormSubmissionOnBirthyearEditingState(
                  submissionSuccess: false, isValid: true)));
      //
      // print('fieldText: ${event.fieldText.toString()}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
      // print('field is ok');
      // print('state is: ${state.toString()}');
    }
  }

  FutureOr<void> _onTextFieldOfBirthyearOnPersonalDetailEditingPopUpCompleted(
      TextFieldOfBirthyearOnPersonalDetailEditingPopUpCompleted event,
      Emitter<TextFieldOfBirthyearOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(
        fieldText: event.fieldText.toString(),
        formSubmissionOnBirthyearEditingState:
            const FormSubmissionOnBirthyearEditingState(
                submissionSuccess: true, isValid: true)));
    //
    // print('fieldText: ${event.fieldText.toString()}');
    // print('fieldText validation: ${validateTemplateName(event.fieldText.toString())}');
    // print('field entered');
    // print('state is: ${state.toString()}');
  }

  FutureOr<void> _onTextFieldOfBirthyearOnPersonalDetailEditingPopUpClear(
      TextFieldOfBirthyearOnPersonalDetailEditingPopUpClear event,
      Emitter<TextFieldOfBirthyearOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(
        fieldText: '',
        formSubmissionOnBirthyearEditingState:
            const FormSubmissionOnBirthyearEditingState(
                isValid: false, submissionSuccess: false)));
    //
    // print('field cleared');
    // print('state is: ${state.toString()}');
  }
}
