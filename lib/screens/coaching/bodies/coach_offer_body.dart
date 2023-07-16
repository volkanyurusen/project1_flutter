import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class CoachOfferBody extends StatefulWidget {
  const CoachOfferBody({super.key});

  @override
  State<CoachOfferBody> createState() => _CoachOfferBodyState();
}

class _CoachOfferBodyState extends State<CoachOfferBody> {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
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
        _buildCoachOfferArea(
            screenHeight, screenWidth, displaySmall, headlineSmall, bodyMedium),
      ]),
    );
  }

  /// BUILD ============================================================================================================
  BlocBuilder<
          ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
          ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState>
      _buildCoachOfferArea(
    double screenHeight,
    double screenWidth,
    TextStyle displaySmall,
    TextStyle headlineSmall,
    TextStyle bodyMedium,
  ) =>
          BlocBuilder<
                  ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
                  ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState>(
              builder: (context, chosenState) {
            return Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: CustomColumn(children: [
                  CoachOfferBodyTrainingTitleArea(chosenState: chosenState),
                  CoachOfferBodyTrainingOfferDetailArea(
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
            .read<
                TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc>()
            .add(
                LoadTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent(
                    traineeId: _findAppUserId,
                    activityNameId: _findTrainingActivityNameId(),
                    offset: _findResponseLength()));
      }
    }
  }

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  int get _findAppUserId => _appNumberConstants.appUserId;

  int _findTrainingActivityNameId() => context
      .read<
          ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit>()
      .state
      .chosenTrainingOfferResponseDynamicList
      .first
      .trainingOfferDynamic
      .trainingDetailDynamic
      .activityNameDynamic
      .activityNameId!;

  int _findResponseLength() => context
      .read<
          TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc>()
      .state
      .trainingOfferResponseDynamicWithDistanceList
      .length;
}
