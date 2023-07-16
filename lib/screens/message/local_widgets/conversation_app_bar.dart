import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class ConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final AppColors _appColors = AppColors();
  final ImageProvider<Object> imageWidget;
  final String infoTitle;
  final String? infoDetail;
  final String date;
  final String? dateDetail;
  final VoidCallback onTap;

  ConversationAppBar({
    required this.imageWidget,
    required this.infoTitle,
    this.infoDetail,
    required this.date,
    this.dateDetail,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle headlineMedium = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: _appColors.scaffoldBackgroundColor);
    TextStyle bodyLarge = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(color: _appColors.scaffoldBackgroundColor.withOpacity(0.75));

    Color backgrounColor = _appColors.primaryColor;
    Color iconColor = _appColors.scaffoldBackgroundColor;
    double leadingCircularImageHeight = 40;
    double leadingCircularImageWidth = 40;

    return AppBar(
      backgroundColor: backgrounColor,
      iconTheme: IconThemeData(color: iconColor),
      title: GestureDetector(
        onTap: onTap,
        child: AppHeader(
          firstWidget: AppHeader(
            firstWidget: MessageImageContainer(
                height: leadingCircularImageHeight,
                width: leadingCircularImageWidth,
                imageWidget: imageWidget),
            secondWidget: const CustomAppSizedBox(width: 10),
            thirdWidget: CustomColumn(children: [
              AppHeaderText(textLabel: infoTitle, textStyle: headlineMedium),
              CustomAppSizedBox(height: infoDetail == null ? 0 : 2),
              AppHeaderText(textLabel: infoDetail ?? '', textStyle: bodyLarge),
            ]),
          ),
          thirdWidget: CustomColumn(children: [
            AppHeaderText(textLabel: date, textStyle: headlineMedium),
            CustomAppSizedBox(height: dateDetail == null ? 0 : 2),
            AppHeaderText(textLabel: dateDetail ?? '', textStyle: bodyLarge),
          ]),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
