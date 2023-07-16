import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class TypeDetailSkelton extends StatelessWidget {
  const TypeDetailSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: _generateListOfDetailSkelton(context));
  }

  List<Widget> _generateListOfDetailSkelton(BuildContext context) {
    return List.generate(
      16,
      (index) => CustomColumn(
        children: [
          _createDetailLine(context, index),
          const CustomAppSizedBox(),
        ],
      ),
    );
  }

  AppHeader _createDetailLine(BuildContext context, int index) => AppHeader(
      spaceFromUpperWidget: index == 0 ? 0 : 18,
      firstWidget: _displayDetailTitleSkelton(context),
      thirdWidget: _displayDetailContentSkelton(context));

  SkeltonContainer _displayDetailTitleSkelton(BuildContext context) =>
      SkeltonContainer(
          height: 24, width: MediaQuery.of(context).size.width * 0.45);

  SkeltonContainer _displayDetailContentSkelton(BuildContext context) =>
      SkeltonContainer(
          height: 24, width: MediaQuery.of(context).size.width * 0.25);
}
