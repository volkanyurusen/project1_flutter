import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_response_dynamic_with_distance_by_chosen_attributes_event.dart';
part 'training_request_response_dynamic_with_distance_by_chosen_attributes_state.dart';

class TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc
    extends Bloc<
        TrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent,
        TrainingRequestResponseDynamicWithDistanceByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc()
      : super(
            const TrainingRequestResponseDynamicWithDistanceByChosenAttributesState(
                status: Status.initial)) {
    on<LoadTrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent>(
        onLoadLocationDetailDynamic);
    on<RecallTrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent>(
        _onRecallTrainingRequestResponseDynamicWithDistanceByChosenAttributes);
  }

  FutureOr<void> onLoadLocationDetailDynamic(
      event,
      Emitter<TrainingRequestResponseDynamicWithDistanceByChosenAttributesState>
          emit) async {
    emit(
        const TrainingRequestResponseDynamicWithDistanceByChosenAttributesState(
            status: Status.loading));

    try {
      final allTrainingRequestResponseDynamicWithDistanceByChosenAttributesResponse =
          await _repositories
              .getTrainingRequestResponseDynamicWithDistanceDataByChosenAttributes(
                  event.activityTitle, event.coachUserId);

      emit(state.copyWith(
          status: Status.success,
          trainingRequestResponseDynamicWithDistanceList:
              allTrainingRequestResponseDynamicWithDistanceByChosenAttributesResponse));
    } catch (e) {
      TrainingRequestResponseDynamicWithDistanceByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void>
      _onRecallTrainingRequestResponseDynamicWithDistanceByChosenAttributes(
          RecallTrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent
              event,
          Emitter<TrainingRequestResponseDynamicWithDistanceByChosenAttributesState>
              emit) {
    emit(state.copyWith(
      status: Status.success,
      trainingRequestResponseDynamicWithDistanceList:
          List.of(state.trainingRequestResponseDynamicWithDistanceList)
            ..clear(),
    ));
  }
}
