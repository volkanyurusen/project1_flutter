import 'package:flutter/material.dart';
// import 'package:my_project/widgets/widget.dart';

class CardEndColumn extends StatelessWidget {
  // final String distance;
  // final String activityDate;
  final Widget widget;

  const CardEndColumn({
    // required this.distance,
    // required this.activityDate,
    required this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Text(activityDate, style: Theme.of(context).textTheme.bodyLarge),
          // const CustomAppSizedBox(height: 6),
          // Text('(nearly $distance km.)',
          //     style: Theme.of(context).textTheme.bodyLarge),
          // const CustomAppSizedBox(height: 25),
          widget,
        ],
      ),
    );
  }
}
