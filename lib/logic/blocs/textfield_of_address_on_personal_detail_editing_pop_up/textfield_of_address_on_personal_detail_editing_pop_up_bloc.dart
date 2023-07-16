import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/form_submission_state.dart';

part 'textfield_of_address_on_personal_detail_editing_pop_up_event.dart';
part 'textfield_of_address_on_personal_detail_editing_pop_up_state.dart';

class TextFieldOfAddressOnPersonalDetailEditingPopUpBloc extends Bloc<
        TextFieldOfAddressOnPersonalDetailEditingPopUpEvent,
        TextFieldOfAddressOnPersonalDetailEditingPopUpState>
    with AddressValidationMixin {
  TextFieldOfAddressOnPersonalDetailEditingPopUpBloc()
      : super(TextFieldOfAddressOnPersonalDetailEditingPopUpState()) {
    on<TextFieldOfAddressOnPersonalDetailEditingPopUpSubmit>(
        _onTextFieldOfAddressOnPersonalDetailEditingPopUpEvent);
    on<TextFieldOfAddressOnPersonalDetailEditingPopUpClear>(
        _onTextFieldOfAddressOnPersonalDetailEditingPopUpClear);
    on<TextFieldOfAddressOnPersonalDetailEditingPopUpCompleted>(
        _onTextFieldOfAddressOnPersonalDetailEditingPopUpCompleted);
  }

  FutureOr<void> _onTextFieldOfAddressOnPersonalDetailEditingPopUpEvent(
      TextFieldOfAddressOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextFieldOfAddressOnPersonalDetailEditingPopUpState> emit) {
    // BEGINNING STATE
    if (state.fieldText == '' &&
        state.formSubmissionOnAddressEditingState.fieldTextError == null &&
        state.formSubmissionOnAddressEditingState.isValid == false &&
        state.formSubmissionOnAddressEditingState.submissionSuccess == false) {
      emit(state.copyWith(
          fieldText: '',
          formSubmissionOnAddressEditingState:
              const FormSubmissionOnAddressEditingState(
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
          formSubmissionOnAddressEditingState:
              const FormSubmissionOnAddressEditingState(
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
          formSubmissionOnAddressEditingState:
              const FormSubmissionOnAddressEditingState(
            isValid: false,
            fieldTextError: FieldError.invalid,
            submissionSuccess: false,
            errorMessage: 'Please use letters/numbers including : , . /',
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
          formSubmissionOnAddressEditingState:
              const FormSubmissionOnAddressEditingState(
            isValid: false,
            fieldTextError: FieldError.short,
            submissionSuccess: false,
            errorMessage: 'Template must be min 5 letters/numbers!!!',
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
          formSubmissionOnAddressEditingState:
              const FormSubmissionOnAddressEditingState(
                  isValid: false,
                  fieldTextError: FieldError.long,
                  submissionSuccess: false,
                  errorMessage:
                      'Template must be max 100 valid character!!!')));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is too long');
      // print('state is: ${state.toString()}');
      // FIELD IS VALID
    } else {
      emit(state.copyWith(
          fieldText: event.fieldText,
          formSubmissionOnAddressEditingState:
              const FormSubmissionOnAddressEditingState(
                  submissionSuccess: false, isValid: true)));
      //
      // print('fieldText: ${event.fieldText}');
      // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
      // print('field is ok');
      // print('state is: ${state.toString()}');
    }
  }

  FutureOr<void> _onTextFieldOfAddressOnPersonalDetailEditingPopUpCompleted(
      TextFieldOfAddressOnPersonalDetailEditingPopUpCompleted event,
      Emitter<TextFieldOfAddressOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(
        fieldText: event.fieldText,
        formSubmissionOnAddressEditingState:
            const FormSubmissionOnAddressEditingState(
                submissionSuccess: true, isValid: true)));
    //
    // print('fieldText: ${event.fieldText}');
    // print('fieldText validation: ${validateTemplateName(event.fieldText)}');
    // print('field entered');
    // print('state is: ${state.toString()}');
  }

  FutureOr<void> _onTextFieldOfAddressOnPersonalDetailEditingPopUpClear(
      TextFieldOfAddressOnPersonalDetailEditingPopUpClear event,
      Emitter<TextFieldOfAddressOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(
        fieldText: '',
        formSubmissionOnAddressEditingState:
            const FormSubmissionOnAddressEditingState(
                isValid: false, submissionSuccess: false)));
    //
    // print('field cleared');
    // print('state is: ${state.toString()}');
  }
}
