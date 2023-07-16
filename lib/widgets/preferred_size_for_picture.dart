import 'package:flutter/material.dart';

class PreferredSizeForPicture extends StatelessWidget
    implements PreferredSizeWidget {
  final BuildContext context;
  final Widget child;
  const PreferredSizeForPicture({
    required this.context,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
        child: child);
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.25);
}
