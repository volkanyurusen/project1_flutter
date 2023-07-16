import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/existence/bodies/zbodies.dart';

import '../../logic/cubits/cubits.dart';
import '../../widgets/widget.dart';

class ScreenOfHost extends StatelessWidget {
  static const String routeName = 'screen_of_host';

  const ScreenOfHost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit =
        context.read<ChosenHostWhoCreatedActivityCubit>();

    return
        // WillPopScope(
        //   onWillPop: () async {
        //     Navigator.of(context).pop();
        //     // _unchooseChosenHost(chosenHostWhoCreatedActivityCubit);
        //     return Future(() => true);
        //   },
        //   child:
        SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: HostBody(
            chosenHostWhoCreatedActivityCubit:
                chosenHostWhoCreatedActivityCubit),
      ),
    );
    // );
  }

  /// METHOD ===========================================================================================================
  /// UnchooseMethod ---------------------------------------------------------------------------------------------------
  // void _unchooseChosenHost(
  //   ChosenHostWhoCreatedActivityCubit chosenHostWhoCreatedActivityCubit,
  // ) =>
  //     chosenHostWhoCreatedActivityCubit.pressBackButton(
  //         chosenHostWhoCreatedActivityCubit
  //             .state.chosenConsistedActivityDynamicWithDistance.last);
}
