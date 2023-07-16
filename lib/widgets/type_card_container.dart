import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class TypeCardContainer extends StatelessWidget {
  final AppListConstants _appListConstants = AppListConstants();
  final bool havingOpacity;
  final int index;
  final Widget? child;

  TypeCardContainer({
    required this.index,
    required this.havingOpacity,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: _findUserType().withOpacity(0.75),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(3, 5))
        ],
        color: _findUserType().withOpacity(havingOpacity == true ? 0.30 : 0.75),
      ),
      child: child,
    );
  }

  Color _findUserType() => _appListConstants.typeColor.elementAt(index);
}
