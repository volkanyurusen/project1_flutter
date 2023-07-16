import 'package:equatable/equatable.dart';

import 'package:my_project/constants/constants.dart';

abstract class FormSubmissionState extends Equatable {
  const FormSubmissionState();

  @override
  List<Object?> get props => [];
}

/// ACTIVITY TEMPLATE ==================================================================================================
/// Adding -------------------------------------------------------------------------------------------------------------
class FormSubmissionOnActivityTemplateAddingState extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnActivityTemplateAddingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// Updating -----------------------------------------------------------------------------------------------------------
class FormSubmissionOnActivityTemplateUpdatingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnActivityTemplateUpdatingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// LOCATION TEMPLATE ==================================================================================================
/// Adding -------------------------------------------------------------------------------------------------------------
class FormSubmissionOnLocationTemplateAddingState extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnLocationTemplateAddingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// Updating -----------------------------------------------------------------------------------------------------------
class FormSubmissionOnLocationTemplateUpdatingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnLocationTemplateUpdatingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// LOCATION TEMPLATE ==================================================================================================
/// Adding -------------------------------------------------------------------------------------------------------------
class FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnLocationTemplateLatitudeLongitudeAddingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// Updating -----------------------------------------------------------------------------------------------------------
class FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnLocationTemplateLatitudeLongitudeUpdatingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// PERSONEL DETAIL ====================================================================================================
/// Name Surname -------------------------------------------------------------------------------------------------------
class FormSubmissionOnNameSurnameEditingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnNameSurnameEditingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// Username -----------------------------------------------------------------------------------------------------------
class FormSubmissionOnUsernameEditingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnUsernameEditingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// Birthyear ----------------------------------------------------------------------------------------------------------
class FormSubmissionOnBirthyearEditingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnBirthyearEditingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// Email --------------------------------------------------------------------------------------------------------------
class FormSubmissionOnEmailEditingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnEmailEditingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// Address -----------------------------------------------------------------------------------------------------------
class FormSubmissionOnAddressEditingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnAddressEditingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// About Yourself -----------------------------------------------------------------------------------------------------
class FormSubmissionOnAboutYourselfEditingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnAboutYourselfEditingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// Min Lesson ---------------------------------------------------------------------------------------------------------
class FormSubmissionOnMinLessonEditingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnMinLessonEditingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}

/// Per Lesson Price ---------------------------------------------------------------------------------------------------
class FormSubmissionOnPerLessonPriceEditingState
// extends Equatable {
    extends FormSubmissionState {
  final bool isValid;
  final FieldError? fieldTextError;
  final bool submissionSuccess;
  final String errorMessage;

  const FormSubmissionOnPerLessonPriceEditingState(
      {this.isValid = false,
      this.fieldTextError,
      this.submissionSuccess = false,
      this.errorMessage = ''});

  @override
  List<Object?> get props =>
      [isValid, fieldTextError, submissionSuccess, errorMessage];
}
