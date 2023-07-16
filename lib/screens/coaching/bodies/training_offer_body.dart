import 'package:flutter/material.dart';
import 'package:my_project/screens/coaching/body_areas/zareas.dart';
import 'package:my_project/screens/coaching/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingOfferBody extends StatelessWidget {
  const TrainingOfferBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const TrainingOfferBodyArea(),
      _displayAddingOfferButton(context),
    ]);
  }

  /// DISPLAY ==========================================================================================================
  CustomFloatActionButton _displayAddingOfferButton(BuildContext context) {
    return CustomFloatActionButton(
      onPressed: () => showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return TrainingOfferAddingPopUp();
          }),
    );
  }
}
