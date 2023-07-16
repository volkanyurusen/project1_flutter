import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/existence/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';



class ScreenOfChosenAttendeeOnCreation extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_attendee_on_creation';

  const ScreenOfChosenAttendeeOnCreation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit =
        context.read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>();
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            appBar: const CustomAppBar(),
            body: ChosenAttendeeOnCreationBody(
                chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit:
                    chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
                screenWidth: screenWidth)));
  }
}
