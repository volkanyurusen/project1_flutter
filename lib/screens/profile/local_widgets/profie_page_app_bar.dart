import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class ProfilePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppColors _appColors = AppColors();
  final String titleText;
  final double? bottomLineHeight;
  final Color? lightTextColor;
  final Widget? icon;

  ProfilePageAppBar({
    required this.titleText,
    this.bottomLineHeight,
    this.lightTextColor,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightTextColor = _appColors.textColor.withOpacity(0.75);
    Color bottomLineColor = lightTextColor.withOpacity(0.25);
    TextStyle? titleHeadline = Theme.of(context)
        .textTheme
        .displayMedium!
        .copyWith(color: lightTextColor);

    return _createProfilePageAppBar(bottomLineColor, titleHeadline);
  }

  /// CREATE ===========================================================================================================
  AppBar _createProfilePageAppBar(
          Color bottomLineColor, TextStyle titleHeadline) =>
      AppBar(
        bottom: _createPrefferdSize(bottomLineColor),
        title: AppHeaderText(textLabel: titleText, textStyle: titleHeadline),
        actions: [icon ?? const SizedBox()],
      );

  PreferredSize _createPrefferdSize(Color bottomLineColor) {
    return PreferredSize(
        preferredSize: _determineSize(),
        child: _displaySizeBottomLine(bottomLineColor));
  }

  /// DISPLAY ==========================================================================================================
  Container _displaySizeBottomLine(Color bottomLineColor) =>
      Container(color: bottomLineColor, height: bottomLineHeight ?? 1.0);

  /// METHODS ==========================================================================================================
  Size _determineSize() => Size.fromHeight(bottomLineHeight ?? 1.0);

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
