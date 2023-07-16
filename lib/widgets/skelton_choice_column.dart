import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class SkeltonChoiceColumn extends StatelessWidget {
  final double screenWidth;
  final Widget? icon;
  const SkeltonChoiceColumn({
    required this.screenWidth,
    this.icon,
    Key? key,
  })  :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon ?? SkeltonContainer(height: 28, width: 28),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeltonContainer(height: 18, width: screenWidth * 0.2),
                      const SizedBox(height: 5),
                      SkeltonContainer(height: 10, width: screenWidth * 0.2)
                    ],
                  ),
                ],
              ),
              SkeltonContainer(height: 28, width: screenWidth * 0.4),
            ],
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
