import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_response_dynamic_with_distance_by_chosen_attributes_event.dart';
part 'training_offer_response_dynamic_with_distance_by_chosen_attributes_state.dart';

class TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc
    extends Bloc<
        TrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent,
        TrainingOfferResponseDynamicWithDistanceByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc()
      : super(
            const TrainingOfferResponseDynamicWithDistanceByChosenAttributesState(
                status: Status.initial)) {
    on<LoadTrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent>(
        onLoadLocationDetailDynamic);
    on<RecallTrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent>(
        _onRecallTrainingOfferResponseDynamicWithDistanceByChosenAttributes);
  }

  FutureOr<void> onLoadLocationDetailDynamic(
      event,
      Emitter<TrainingOfferResponseDynamicWithDistanceByChosenAttributesState>
          emit) async {
    emit(const TrainingOfferResponseDynamicWithDistanceByChosenAttributesState(
        status: Status.loading));

    try {
      final allTrainingOfferResponseDynamicWithDistanceByChosenAttributesResponse =
          await _repositories
              .getTrainingOfferResponseDynamicWithDistanceDataByChosenAttributes(
                  event.activityTitle, event.userId);

      emit(state.copyWith(
          status: Status.success,
          trainingOfferResponseDynamicWithDistanceList:
              allTrainingOfferResponseDynamicWithDistanceByChosenAttributesResponse));
    } catch (e) {
      TrainingOfferResponseDynamicWithDistanceByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void>
      _onRecallTrainingOfferResponseDynamicWithDistanceByChosenAttributes(
          RecallTrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent
              event,
          Emitter<TrainingOfferResponseDynamicWithDistanceByChosenAttributesState>
              emit) {
    emit(state.copyWith(
      status: Status.success,
      trainingOfferResponseDynamicWithDistanceList:
          List.of(state.trainingOfferResponseDynamicWithDistanceList)..clear(),
    ));
  }
}
