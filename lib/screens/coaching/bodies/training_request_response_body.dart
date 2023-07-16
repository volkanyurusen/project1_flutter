import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingRequestResponseBody extends StatefulWidget {
  const TrainingRequestResponseBody({super.key});

  @override
  State<TrainingRequestResponseBody> createState() =>
      _TrainingRequestResponseBodyState();
}

class _TrainingRequestResponseBodyState
    extends State<TrainingRequestResponseBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.height;
    double screenWidth = context.width;
    TextStyle? displaySmall = context.textTheme.displaySmall!;
    TextStyle? headlineSmall = context.textTheme.headlineSmall!;
    TextStyle? bodyMedium = context.textTheme.bodyMedium!;

    return AppBody(
      child: CustomColumn(children: [
        const CustomAppSizedBox(),
        _buildTrainingRequestResponseArea(
            screenHeight, screenWidth, displaySmall, headlineSmall, bodyMedium),
      ]),
    );
  }

  /// BUILD ============================================================================================================
  BlocBuilder<
          ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
          ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState>
      _buildTrainingRequestResponseArea(
    double screenHeight,
    double screenWidth,
    TextStyle displaySmall,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
          BlocBuilder<
                  ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
                  ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState>(
              builder: (context, chosenState) {
            return Expanded(
                child: SingleChildScrollView(
              controller: _scrollController,
              child: CustomColumn(children: [
                TrainingRequestResponseBodyTrainingRequestResponseTitleArea(
                    chosenState: chosenState),
                TrainingRequestResponseBodyTrainingRequestResponseDetailArea(
                    screenHeight: screenHeight, screenWidth: screenWidth)
              ]),
            ));
          });

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        context
            .read<
                TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc>()
            .add(LoadTrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent(
                trainingRequestId: context
                    .read<
                        ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit>()
                    .state
                    .chosenTrainingRequestDynamicList
                    .first
                    .trainingRequestId!,
                offset: context
                    .read<
                        TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc>()
                    .state
                    .trainingRequestResponseDynamicWithDistanceList
                    .length));
      }
    }
  }
}
