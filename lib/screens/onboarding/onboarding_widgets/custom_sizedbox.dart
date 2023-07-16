import 'package:flutter/cupertino.dart';

class CustomSizedBox extends StatelessWidget {
  final double ratio;
  const CustomSizedBox({
    Key? key,
    required this.ratio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * ratio,
    );
  }
}
