import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class ActionPopUp extends StatelessWidget {
  final AppColors _appColors = AppColors();

  final void Function()? actionVoidCallBack;
  final VoidCallback cancelVoidCallBack;
  final String? titleContent;
  final String? action;

  ActionPopUp({
    required this.actionVoidCallBack,
    required this.cancelVoidCallBack,
    this.titleContent,
    this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleStyle = context.textTheme.titleLarge;
    final TextStyle buttonTextStyle =
        context.textTheme.titleLarge!.copyWith(color: _appColors.primary);

    return CustomBackDropFilter(
        child: AlertDialog(
      title: AppHeaderText(
          textLabel: titleContent ?? 'Discard Draft?', textStyle: titleStyle),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              cancelVoidCallBack();
              _closeTheScreen(context);
            },
            child:
                AppHeaderText(textLabel: "Cancel", textStyle: buttonTextStyle)),
        TextButton(
          onPressed:
              //
              //() {
              actionVoidCallBack,
          //
          // _closeTheScreen(context);
          // }),
          child: AppHeaderText(
              textLabel: action ?? 'Delete', textStyle: buttonTextStyle),
        )
      ],
    ));
  }

  void _closeTheScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}

// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/widgets/widget.dart';

// class ActionPopUp extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final VoidCallback actionVoidCallBack;
//   final VoidCallback cancelVoidCallBack;
//   final String? titleContent;
//   final String? action;

//   ActionPopUp({
//     required this.actionVoidCallBack,
//     required this.cancelVoidCallBack,
//     this.titleContent,
//     this.action,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle? titleStyle = context.textTheme.titleLarge;
//     final TextStyle buttonTextStyle =
//         context.textTheme.titleLarge!.copyWith(color: _appColors.primary);

//     return CustomBackDropFilter(
//         child: AlertDialog(
//       title: AppHeaderText(
//           textLabel: titleContent ?? 'Discard Draft?', textStyle: titleStyle),
//       actions: <Widget>[
//         TextButton(
//           child: AppHeaderText(textLabel: "Cancel", textStyle: buttonTextStyle),
//           onPressed: () {
//             cancelVoidCallBack();
//             _closeTheScreen(context);
//           },
//         ),
//         TextButton(
//           child: AppHeaderText(
//               textLabel: action ?? 'Delete', textStyle: buttonTextStyle),
//           onPressed: () {
//             actionVoidCallBack();
//             _closeTheScreen(context);
//           },
//         ),
//       ],
//     ));
//   }

//   void _closeTheScreen(BuildContext context) {
//     Navigator.of(context).pop();
//   }
// }
