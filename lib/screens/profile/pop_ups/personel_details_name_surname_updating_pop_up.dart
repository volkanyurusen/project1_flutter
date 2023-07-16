// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/logic/blocs/text_of_name_surname_for_updating_on_personal_detail_pop_up/text_of_name_surname_for_updating_on_personal_detail_pop_up_bloc.dart';
// import 'package:my_project/widgets/widget.dart';

// class PersonelDetailsNameSurnameUpdatingPopUp extends StatefulWidget {
//   final NameTextFormFieldOnNameSurnameUpdatingPopUpBloc
//       nameTextFormFieldOnNameSurnameUpdatingPopUpBloc;
//   final double screenWidth;

//   const PersonelDetailsNameSurnameUpdatingPopUp({
//     required this.nameTextFormFieldOnNameSurnameUpdatingPopUpBloc,
//     required this.screenWidth,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<PersonelDetailsNameSurnameUpdatingPopUp> createState() =>
//       _PersonelDetailsNameSurnameUpdatingPopUpState();
// }

// class _PersonelDetailsNameSurnameUpdatingPopUpState
//     extends State<PersonelDetailsNameSurnameUpdatingPopUp> {
//   final AppColors _appColors = AppColors();
//   final AppTextConstants _appTextConstants = AppTextConstants();
//   final AppFunctions _appFunctions = AppFunctions();

//   @override
//   void initState() {
//     super.initState();
//     context.read<TextOfNameSurnameForUpdatingOnPersonalDetailPopUpBloc>().add(
//         TextOfNameSurnameForUpdatingOnPersonalDetailPopUpSubmit(
//             context.read<UserBloc>().state.userList.last.nameSurname));
//   }

//   @override
//   Widget build(BuildContext context) {
//     Color lightColor = _appColors.textColor.withOpacity(0.5);
//     Color textColor = _appColors.textColor;
//     Color backgroundColor = Theme.of(context).colorScheme.background;
//     TextStyle originalText =
//         context.textTheme.displayMedium!.copyWith(color: textColor);
//     TextStyle? textLabelStyle = Theme.of(context)
//         .textTheme
//         .headlineMedium!
//         .copyWith(
//             fontWeight: FontWeight.normal,
//             color: _appColors.textColor.withOpacity(0.75));
//     TextStyle? buttonTheme =
//         context.textTheme.headlineSmall!.copyWith(color: backgroundColor);

//     bool checkPreviousState = false;

//     return CustomColumn(
//       children: [
//         _createTemplateNameTitle(),
//         _createShowDialogButton(context, checkPreviousState, textLabelStyle,
//             buttonTheme, backgroundColor, originalText, lightColor, textColor),
//         // const CustomAppSizedBox(),
//       ],
//     );
//   }

//   /// TITLES ===========================================================================================================
//   CustomTitle _createTemplateNameTitle() =>
//       const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Name Surname');

//   /// CREATE ===========================================================================================================
//   GestureDetector _createShowDialogButton(
//       BuildContext context,
//       bool checkPreviousState,
//       TextStyle textLabelStyle,
//       TextStyle buttonTheme,
//       Color backgroundColor,
//       TextStyle originalText,
//       Color lightColor,
//       Color textColor) {
//     return GestureDetector(
//       child: _createTemplateNameArea(
//           checkPreviousState, originalText, lightColor, textColor),
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (diaglogContext) => _createTextDialog(context,
//               checkPreviousState, textLabelStyle, buttonTheme, backgroundColor),
//         );
//       },
//     );
//   }

//   ValidationDialog _createTextDialog(
//     BuildContext context,
//     bool checkPreviousState,
//     TextStyle textLabelStyle,
//     TextStyle buttonTheme,
//     Color backgroundColor,
//   ) =>
//       ValidationDialog(
//         child: CustomColumn(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildNameTextField(checkPreviousState),
//             _createBottomButtonArea(
//                 context, checkPreviousState, buttonTheme, backgroundColor),
//           ],
//         ),
//       );

//   AppHeader _createTemplateNameArea(bool checkPreviousState,
//           TextStyle originalText, Color lightColor, Color textColor) =>
//       AppHeader(
//         firstWidget: BlocBuilder<
//             TextOfNameSurnameForUpdatingOnPersonalDetailPopUpBloc,
//             TextOfNameSurnameForUpdatingOnPersonalDetailPopUpState>(
//           builder: (context, state) {
//             if (state.nameSurname == '') {
//               _getInitialTemplateName(context);
//             }
//             return AppHeaderText(
//                 textLabel: _appFunctions.showString(
//                     lenght: 16, state.nameSurname ?? ''),
//                 textStyle: originalText);
//           },
//         ),
//         thirdWidget: Icon(Icons.edit, color: textColor),
//       );

//   CustomRow _createBottomButtonArea(
//     BuildContext context,
//     bool checkPreviousState,
//     TextStyle buttonTheme,
//     Color backgroundColor,
//   ) =>
//       CustomRow(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           _displayCancelButton(
//               context, checkPreviousState, buttonTheme, backgroundColor),
//           _displayUpdatingButton(
//               context, checkPreviousState, buttonTheme, backgroundColor),
//         ],
//       );

//   /// BUILD ============================================================================================================
//   BlocBuilder<NameTextFormFieldOnNameSurnameUpdatingPopUpBloc,
//       NameTextFormFieldOnNameSurnameUpdatingPopUpState> _buildNameTextField(
//     bool checkPreviousState,
//   ) =>
//       BlocBuilder<NameTextFormFieldOnNameSurnameUpdatingPopUpBloc,
//           NameTextFormFieldOnNameSurnameUpdatingPopUpState>(
//         builder: (context, state) {
//           if (checkPreviousState == false) {
//             _getExistingTemplateName(context);
//           }
//           checkPreviousState = true;
//           return _displayTemplateNameTextField(context, state);
//         },
//       );

//   /// DISPLAY ==========================================================================================================
//   NameTextField _displayTemplateNameTextField(
//     BuildContext context,
//     NameTextFormFieldOnNameSurnameUpdatingPopUpState state,
//   ) =>
//       NameTextField(
//           initialValue: state.fieldText == ''
//               ? _findChosenTemplateName(context)
//               : _findText(state),
//           onChanged: (value) {
//             _addTemplateName(context, value);
//           },
//           limitOfTextLenght: 31,
//           isTextValid: _checkTemplateNameIsValid(state),
//           labelName: 'Template Name',
//           errorMessage: _findCorrectErrorMessage(state));

//   /// CANCEL BUTTON ----------------------------------------------------------------------------------------------------
//   CustomElevatedButton _displayCancelButton(
//     BuildContext context,
//     bool checkPreviousState,
//     TextStyle buttonTheme,
//     Color backgroundColor,
//   ) =>
//       CustomElevatedButton(
//           textlabel: _appTextConstants.cancel,
//           textStyle: buttonTheme,
//           elevatedButtonWidth: _findButtonWidth,
//           buttonColor: _appColors.buttonDarkColor,
//           onPressed: () => _clickCancelButton(context, checkPreviousState));

//   /// ADD BUTTON -------------------------------------------------------------------------------------------------------
//   BlocBuilder<NameTextFormFieldOnNameSurnameUpdatingPopUpBloc,
//       NameTextFormFieldOnNameSurnameUpdatingPopUpState> _displayUpdatingButton(
//     BuildContext context,
//     bool checkPreviousState,
//     TextStyle headlineSmall,
//     Color backgroundColor,
//   ) =>
//       BlocBuilder<NameTextFormFieldOnNameSurnameUpdatingPopUpBloc,
//           NameTextFormFieldOnNameSurnameUpdatingPopUpState>(
//         builder: (context, state) {
//           return CustomElevatedButton(
//               textlabel: _appTextConstants.update,
//               textStyle: headlineSmall.copyWith(color: backgroundColor),
//               elevatedButtonWidth: _findButtonWidth,
//               buttonColor: _appColors.secondary,
//               onPressed: _checkTemplateNameIsValid(state)
//                       //
//                       // state.formSubmissionOnNameSurnameUpdatingState.isValid == true
//                       ||
//                       _checkTemplateNameEnteredCorrectly(state)
//                   ? () => _clickUpdateButton(context, state, checkPreviousState)
//                   : null);
//         },
//       );

//   /// METHODS ==========================================================================================================
//   void _getInitialTemplateName(BuildContext context) {
//     context.read<NameTextFormFieldOnNameSurnameUpdatingPopUpBloc>().add(
//         NameTextFormFieldOnNameSurnameUpdatingPopUpSubmit(
//             _findChosenTemplateName(context)));
//   }

//   void _getExistingTemplateName(BuildContext context) {
//     context.read<NameTextFormFieldOnNameSurnameUpdatingPopUpBloc>().add(
//         NameTextFormFieldOnNameSurnameUpdatingPopUpSubmit(
//             _findTemplateName(context)));
//   }

//   void _addTemplateName(BuildContext context, String value) => context
//       .read<NameTextFormFieldOnNameSurnameUpdatingPopUpBloc>()
//       .add(NameTextFormFieldOnNameSurnameUpdatingPopUpSubmit(value));

//   void _clickCancelButton(
//     BuildContext dialogContext,
//     bool checkPreviousState,
//   ) {
//     _closePopUp(dialogContext);
//     Future.delayed(
//       const Duration(milliseconds: 500),
//       () {
//         widget.nameTextFormFieldOnNameSurnameUpdatingPopUpBloc.add(
//             NameTextFormFieldOnNameSurnameUpdatingPopUpSubmit(dialogContext
//                 .read<TextOfNameSurnameForUpdatingOnPersonalDetailPopUpBloc>()
//                 .state
//                 .nameSurname!));
//         checkPreviousState = false;
//       },
//     );
//   }

//   void _clickUpdateButton(
//     BuildContext dialogContext,
//     NameTextFormFieldOnNameSurnameUpdatingPopUpState state,
//     bool checkPreviousState,
//   ) {
//     checkPreviousState = false;
//     _closePopUp(dialogContext);
//     dialogContext
//         .read<TextOfNameSurnameForUpdatingOnPersonalDetailPopUpBloc>()
//         .add(TextOfNameSurnameForUpdatingOnPersonalDetailPopUpSubmit(
//             _findText(state)));
//   }

//   /// Check Methods ----------------------------------------------------------------------------------------------------
//   bool _checkTemplateNameIsValid(
//           NameTextFormFieldOnNameSurnameUpdatingPopUpState state) =>
//       state.formSubmissionOnNameSurnameUpdatingState.isValid != false;

//   bool _checkTemplateNameEnteredCorrectly(
//           NameTextFormFieldOnNameSurnameUpdatingPopUpState state) =>
//       state.formSubmissionOnNameSurnameUpdatingState.submissionSuccess == true;

//   /// Find Methods -----------------------------------------------------------------------------------------------------
//   String _findTemplateName(BuildContext context) => context
//       .read<TextOfNameSurnameForUpdatingOnPersonalDetailPopUpBloc>()
//       .state
//       .nameSurname!;

//   String _findText(NameTextFormFieldOnNameSurnameUpdatingPopUpState state) =>
//       state.fieldText!;

//   String _findChosenTemplateName(BuildContext context) =>
//       context.read<UserBloc>().state.userList.last.nameSurname;

//   String _findCorrectErrorMessage(
//           NameTextFormFieldOnNameSurnameUpdatingPopUpState state) =>
//       state.formSubmissionOnNameSurnameUpdatingState.errorMessage;

//   double get _findButtonWidth => widget.screenWidth * 0.90 * 0.34;

//   /// Screen Methods ---------------------------------------------------------------------------------------------------
//   void _closePopUp(BuildContext dialogContext) {
//     Navigator.of(dialogContext).pop();
//   }
// }
