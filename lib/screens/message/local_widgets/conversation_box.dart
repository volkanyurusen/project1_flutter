import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class ConversationBox extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final ImageProvider<Object> imageWidget;
  final String textOf;
  final String? textDetailOf;
  final String textOfDateDetail;
  final String textOfDate;
  final Widget widget;
  final bool isActivityCreatedByAppUser;
  final bool isActivityNotPassed;
  final Color? pastActivityColor;

  ConversationBox({
    required this.imageWidget,
    required this.textOf,
    this.textDetailOf,
    required this.textOfDateDetail,
    required this.textOfDate,
    required this.widget,
    this.isActivityCreatedByAppUser = false,
    required this.isActivityNotPassed,
    this.pastActivityColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxHeight = 70;
    double imageBoxHeight = boxHeight;
    double imageBoxWidth = boxHeight;
    final TextStyle headlineSmall = context.textTheme.headlineSmall!;
    final TextStyle titleLarge = context.textTheme.titleLarge!;
    final TextStyle bodyLarge = context.textTheme.bodyLarge!;

    return AppHeader(
      firstWidget: AppHeader(
        firstWidget: Opacity(
          opacity: isActivityNotPassed ? 1.0 : 0.5,
          child: MessageImageContainer(
            height: imageBoxHeight,
            width: imageBoxWidth,
            imageWidget: imageWidget,
          ),
        ),
        secondWidget: const CustomAppSizedBox(width: 10),
        thirdWidget: CustomColumn(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppHeader(
              firstWidget: AppHeader(
                firstWidget: AppHeaderText(
                  textLabel: _appFunctions.showString(textOf),
                  textStyle: _displayTextStyle(headlineSmall),
                ),
                secondWidget: const CustomAppSizedBox(width: 5),
                thirdWidget: isActivityCreatedByAppUser
                    ? Icon(Icons.create_outlined,
                        size: 12,
                        color: isActivityNotPassed
                            ? _appColors.textColor
                            : pastActivityColor ?? _appColors.secondary)
                    : const SizedBox(),
              ),
              secondWidget: const CustomAppSizedBox(width: 2),
              thirdWidget: AppHeaderText(
                  textLabel: textDetailOf ?? '',
                  textStyle: _displayTextStyle(titleLarge)),
            ),
            const CustomAppSizedBox(height: 5),
            widget,
          ],
        ),
      ),
      thirdWidget: CustomColumn(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppHeaderText(
            textLabel: textOfDate,
            textStyle: _displayTextStyle(headlineSmall),
          ),
          const CustomAppSizedBox(height: 5),
          AppHeaderText(
            textLabel: textOfDateDetail,
            textStyle: _displayTextStyle(bodyLarge),
          )
        ],
      ),
    );
  }

  TextStyle _displayTextStyle(TextStyle textType) => _determineTextStyle(
        isActivityNotPassed,
        textType,
        pastActivityColor ?? _appColors.secondary,
      );

  TextStyle _determineTextStyle(
    bool checkMethod,
    TextStyle textStyle,
    Color pastActivityColor,
  ) =>
      checkMethod ? textStyle : textStyle.copyWith(color: pastActivityColor);
}
