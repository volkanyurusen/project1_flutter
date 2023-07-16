import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingOfferResponseBody extends StatefulWidget {
  const TrainingOfferResponseBody({super.key});

  @override
  State<TrainingOfferResponseBody> createState() =>
      _TrainingOfferResponseBodyState();
}

class _TrainingOfferResponseBodyState extends State<TrainingOfferResponseBody> {
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
        _buildTrainingOfferResponseArea(
            screenHeight, screenWidth, displaySmall, headlineSmall, bodyMedium),
      ]),
    );
  }

  /// BUILD ============================================================================================================
  BlocBuilder<ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
          ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState>
      _buildTrainingOfferResponseArea(
    double screenHeight,
    double screenWidth,
    TextStyle displaySmall,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
          BlocBuilder<ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
                  ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachState>(
              builder: (context, chosenState) {
            return Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: CustomColumn(children: [
                  TrainingOfferResponseBodyTrainingOfferResponseTitleArea(
                      chosenState: chosenState),
                  TrainingOfferResponseBodyTrainingOfferResponseDetailArea(
                      screenHeight: screenHeight, screenWidth: screenWidth)
                ]),
              ),
            );
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
            .read<TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc>()
            .add(
                LoadTrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent(
                    trainingOfferId: _findTrainingOfferId(),
                    offset: _findResponseListLength()));
      }
    }
  }

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findTrainingOfferId() => context
      .read<ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit>()
      .state
      .chosenTrainingOfferDynamicList
      .first
      .trainingOfferId!;

  int _findResponseListLength() => context
      .read<TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc>()
      .state
      .trainingOfferResponseDynamicWithDistanceList
      .length;
}
