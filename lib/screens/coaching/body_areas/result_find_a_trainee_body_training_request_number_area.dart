import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class ResultFindATraineeBodyTrainingRequestNumberArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final double screenWidth;

  ResultFindATraineeBodyTrainingRequestNumberArea({
    required this.screenWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TrainingRequestDynamicWithDistanceByUserState state =
        context.read<TrainingRequestDynamicWithDistanceByUserBloc>().state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    /// This widget displays how many activity/activities exist in the system according to user's choice
    return CustomColumn(children: [
      //
      // const CustomAppSizedBox(),
      AppHeader(
        secondWidget: AppHeaderText(
            textLabel: _displayActivityNumber(state), textStyle: displaySmall),
        //
        // firstWidget: const Icon(Icons.swap_vert_rounded),
        // firstWidget: const Icon(Icons.format_line_spacing),
        // thirdWidget: const Icon(Icons.filter_list),
      ),
      const CustomAppSizedBox(height: 8),
    ]);
  }

  /// This method displays the activity numbers
  /// DISPLAY ==========================================================================================================
  String _displayActivityNumber(
    TrainingRequestDynamicWithDistanceByUserState state,
  ) =>
      '${_appFunctions.correctNumberFormat.format(state.trainingRequestDynamicWithDistanceList.length).toString()} requests';
}
