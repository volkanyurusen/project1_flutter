import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ResultFindATraineeBody extends StatelessWidget {
  const ResultFindATraineeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrainingRequestDynamicWithDistanceByUserBloc
        trainingRequestDynamicWithDistanceByUserBloc =
        context.read<TrainingRequestDynamicWithDistanceByUserBloc>();
    double screenWidth = context.width;

    return AppBody(
      alignment: trainingRequestDynamicWithDistanceByUserBloc
              .state.trainingRequestDynamicWithDistanceList.isEmpty
          ? Alignment.center
          : Alignment.topLeft,
      child: _bringResultOfTrainingRequestFromDBAndDisplayThem(screenWidth),
    );
  }

  BlocBuilder<TrainingRequestDynamicWithDistanceByUserBloc,
          TrainingRequestDynamicWithDistanceByUserState>
      _bringResultOfTrainingRequestFromDBAndDisplayThem(
    double screenWidth,
  ) =>
          BlocBuilder<TrainingRequestDynamicWithDistanceByUserBloc,
              TrainingRequestDynamicWithDistanceByUserState>(
            buildWhen: (previous, current) =>
                previous.trainingRequestDynamicWithDistanceList !=
                current.trainingRequestDynamicWithDistanceList,
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return const StateLoading();
                case StatusWithoutLoading.success:
                  if (state.trainingRequestDynamicWithDistanceList.isEmpty) {
                    return const InformationAboutExisting(
                        detailLabel: 'trainee request');
                  } else {
                    return _bringTrainingRequestFromDBAndDisplayThem(
                        state, screenWidth);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  CustomColumn _bringTrainingRequestFromDBAndDisplayThem(
    TrainingRequestDynamicWithDistanceByUserState state,
    double screenWidth,
  ) =>
      CustomColumn(
        children: [
          ResultFindATraineeBodyHeaderArea(screenWidth: screenWidth),
          ResultFindATraineeBodyTrainingRequestNumberArea(
              screenWidth: screenWidth),
          ResultFindATraineeBodyTrainingRequestArea(screenWidth: screenWidth)
        ],
      );
}
