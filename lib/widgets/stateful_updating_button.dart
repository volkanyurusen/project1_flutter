import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class StatefulUpdatingButton<B extends BlocBase<S>, S extends Object>
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();

  final B myBloc;
  final Widget Function(BuildContext context, S state, Widget? extractedWidget)
      builder;
  final double? buttonWidth;
  final TextStyle? buttonTheme;
  final void Function()? onPressed;

  StatefulUpdatingButton({
    required this.myBloc,
    required this.builder,
    required this.buttonWidth,
    required this.buttonTheme,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      bloc: myBloc,
      builder: (context, state) {
        final Widget updatingButton = CustomElevatedButton(
          textlabel: _appTextConstants.save,
          textStyle: buttonTheme,
          elevatedButtonWidth: buttonWidth,
          buttonColor: _appColors.secondary,
          onPressed: onPressed,
        );
        return builder(context, state, updatingButton);
      },
    );
  }
}
