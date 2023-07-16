import 'package:flutter/material.dart';

import 'widget.dart';

class MaxSizeCustomRow extends StatelessWidget {
  final List<Widget> children;
  const MaxSizeCustomRow({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRow(
      mainAxisSize: MainAxisSize.max,
      children: children,
    );
  }
}
