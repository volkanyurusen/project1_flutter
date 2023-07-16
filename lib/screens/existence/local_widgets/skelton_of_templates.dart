import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class SkeltonOfTemplates extends StatelessWidget {
  final double? height;
  final double? width;

  const SkeltonOfTemplates({
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SkeltonContainer(
            height: height ?? MediaQuery.of(context).size.height * 0.45,
            width: width ?? MediaQuery.of(context).size.width * 0.80,
          ),
        ),
        const CustomAppSizedBox(height: 9),
        SkeltonContainer(height: 18, width: 90),
        const CustomAppSizedBox(),
      ],
    );
  }
}
