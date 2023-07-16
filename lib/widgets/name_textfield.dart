import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class NameTextField extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final String? initialValue;
  final void Function(String)? onChanged;
  final int limitOfTextLenght;
  final bool isTextValid;
  final String labelName;
  final String errorMessage;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  NameTextField({
    this.initialValue,
    this.onChanged,
    required this.limitOfTextLenght,
    required this.isTextValid,
    required this.labelName,
    required this.errorMessage,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? textFieldTextStyle = context
        .textTheme
        .displaySmall!
        .copyWith(
            fontWeight: FontWeight.normal,
            color: _appColors.textColor.withOpacity(1.00));
    TextStyle? textLabelStyle =
        context.textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.normal,
              color: _appColors.textColor,
            );
    TextStyle? errorColor =
        context.textTheme.headlineSmall!.copyWith(color: Colors.red);

    return CustomColumn(
      children: [
        TextFormField(
          initialValue: initialValue!,
          onChanged: onChanged,
          style: textFieldTextStyle,
          autofocus: true,
          validator: validator,
          inputFormatters: inputFormatters ??
              [LengthLimitingTextInputFormatter(limitOfTextLenght)],
          textInputAction: TextInputAction.done,
          keyboardType: keyboardType ?? TextInputType.text,
          maxLines: null,
          decoration: InputDecoration(
            focusedBorder: isTextValid
                ? AppOutlineInputBorder.success
                : AppOutlineInputBorder.error,
            enabledBorder: AppOutlineInputBorder.enabled,
            labelText: labelName,
            labelStyle: textLabelStyle,
          ),
        ),
        AppHeaderText(
          textLabel: errorMessage,
          //
          // textLabel: state.fieldText == '' &&
          //         state.formSubmissionOnAddingActivityTemplateState
          //                 .fieldTextError ==
          //             null &&
          //         state.formSubmissionOnAddingActivityTemplateState
          //                 .isValid ==
          //             false &&
          //         state.formSubmissionOnAddingActivityTemplateState
          //                 .submissionSuccess ==
          //             false
          //     ? 'Field cannot be stayed empty!!!'
          //     : state.formSubmissionOnAddingActivityTemplateState
          //                 .fieldTextError ==
          //             FieldError.empty
          //         ? 'Field cannot be stayed empty!!!'
          //         : state.formSubmissionOnAddingActivityTemplateState
          //                     .fieldTextError ==
          //                 FieldError.invalid
          //             ? 'Please use only letters and numbers!!!'
          //             : state.formSubmissionOnAddingActivityTemplateState
          //                         .fieldTextError ==
          //                     FieldError.short
          //                 ? 'Template must be min 3 letters/numbers!!!'
          //                 : state.formSubmissionOnAddingActivityTemplateState
          //                             .fieldTextError ==
          //                         FieldError.long
          //                     ? 'Template must be max 30 letters/numbers!!!'
          //                     : '',
          textStyle: errorColor,
        ),
      ],
    );
  }
}
