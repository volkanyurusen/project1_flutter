import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class InformationAboutExisting extends StatelessWidget {
  final String detailLabel;
  const InformationAboutExisting({
    required this.detailLabel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppHeaderText(
        textLabel: 'There is no yet $detailLabel',
        textStyle: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
