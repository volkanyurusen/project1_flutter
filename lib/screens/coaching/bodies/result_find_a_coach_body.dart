import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ResultFindACoachBody extends StatelessWidget {
  const ResultFindACoachBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrainingOfferDynamicWithDistanceByUserBloc
        trainingOfferDynamicWithDistanceByUserBloc =
        context.read<TrainingOfferDynamicWithDistanceByUserBloc>();
    double screenHeight = context.height;
    double screenWidth = context.width;

    return AppBody(
      alignment: trainingOfferDynamicWithDistanceByUserBloc
              .state.trainingOfferDynamicWithDistanceList.isEmpty
          ? Alignment.center
          : Alignment.topLeft,
      child: _bringResultOfTrainingOfferFromDBAndDisplayThem(
          screenHeight, screenWidth),
    );
  }

  BlocBuilder<TrainingOfferDynamicWithDistanceByUserBloc,
          TrainingOfferDynamicWithDistanceByUserState>
      _bringResultOfTrainingOfferFromDBAndDisplayThem(
    double screenHeight,
    double screenWidth,
  ) =>
          BlocBuilder<TrainingOfferDynamicWithDistanceByUserBloc,
              TrainingOfferDynamicWithDistanceByUserState>(
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return const StateLoading();
                case StatusWithoutLoading.success:
                  if (state.trainingOfferDynamicWithDistanceList.isEmpty) {
                    return const InformationAboutExisting(
                        detailLabel: 'coach offer');
                  } else {
                    return _bringTrainingOfferFromDBAndDisplayThem(
                        state, screenHeight, screenWidth);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  CustomColumn _bringTrainingOfferFromDBAndDisplayThem(
    TrainingOfferDynamicWithDistanceByUserState state,
    double screenHeight,
    double screenWidth,
  ) =>
      CustomColumn(
        children: [
          ResultFindACoachBodyHeaderArea(screenWidth: screenWidth),
          ResultFindACoachBodyTrainingOfferNumberArea(screenWidth: screenWidth),
          ResultFindACoachBodyTrainingOfferArea(
              screenHeight: screenHeight, screenWidth: screenWidth)
        ],
      );
}
