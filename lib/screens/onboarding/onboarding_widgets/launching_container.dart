import 'package:flutter/material.dart';

class LaunchingContainer extends StatelessWidget {
  final String containerText;
  final Color appColors;

  const LaunchingContainer({
    Key? key,
    required this.appColors,
    required this.containerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: appColors),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      padding: const EdgeInsets.all(10.0),
      child: Text(
        containerText,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: appColors),
      ),
    );
  }
}
