import 'package:flutter/material.dart';

class StateLoading extends StatelessWidget {
  const StateLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
