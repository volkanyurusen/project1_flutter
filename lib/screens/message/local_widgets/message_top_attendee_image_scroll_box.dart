import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class MessageTopAttendeeImageScrollBox extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool? reverse;

  const MessageTopAttendeeImageScrollBox({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.reverse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: HorizontalScrollBox(
            child: CustomListViewBuilder(
                scrollDirection: Axis.horizontal,
                reverse: reverse ?? true,
                itemCount: itemCount,
                itemBuilder: itemBuilder)));
  }
}
