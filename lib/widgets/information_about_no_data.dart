import 'package:flutter/material.dart';

import 'widget.dart';

class InformationAboutNoData extends StatelessWidget {
  final String informationText;
  const InformationAboutNoData({
    required this.informationText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge!;
    return AppHeader(
        firstWidget:
            AppHeaderText(textLabel: informationText, textStyle: titleLarge));
  }
}
