import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class LocationChoiceButton extends StatelessWidget {
  final void Function()? onTap;
  final String locationName;
  final bool isFirst;

  const LocationChoiceButton({
    this.onTap,
    required this.locationName,
    this.isFirst = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? locationNameTextStyle = context.textTheme.titleLarge;

    return CustomColumn(
      children: [
        _checkWhetherTheWidgetIsFirst(),
        _createButtonArea(locationNameTextStyle),
        const CustomAppSizedBox(),
      ],
    );
  }

  // METHODS ===========================================================================================================
  Widget _checkWhetherTheWidgetIsFirst() =>
      isFirst ? const CustomAppSizedBox(height: 10) : const SizedBox();

  // BUTTON AREA =======================================================================================================
  // CREATE ============================================================================================================
  GestureDetector _createButtonArea(TextStyle? locationNameTextStyle) =>
      GestureDetector(
        onTap: onTap,
        child: _createIconAndTextArea(locationNameTextStyle),
      );

  // ICON & TEXT AREA ==================================================================================================
  // CREATE ============================================================================================================
  AppHeader _createIconAndTextArea(TextStyle? locationNameTextStyle) =>
      AppHeader(
          firstWidget: AppHeader(
              firstWidget: _displayILocationIcon(),
              secondWidget: const CustomAppSizedBox(width: 10, height: 0),
              thirdWidget: _displayLocationName(locationNameTextStyle)));

  // DISPLAY ===========================================================================================================
  Icon _displayILocationIcon() => const Icon(Icons.location_on_outlined);

  AppHeaderText _displayLocationName(TextStyle? locationNameTextStyle) =>
      AppHeaderText(textLabel: locationName, textStyle: locationNameTextStyle);
}
