import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class PopUpBody extends StatelessWidget {
  final List<Widget> children;
  final double height;

  const PopUpBody({
    required this.children,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBackDropFilter(
      child: PopUpDialog(
        child: PopUpContainer(
          height: height,
          child: AppBody(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: CustomColumn(
                    children: children,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
