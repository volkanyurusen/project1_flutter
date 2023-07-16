import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_response_dynamic_with_distance_by_training_offer_event.dart';
part 'training_offer_response_dynamic_with_distance_by_training_offer_state.dart';

class TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc extends Bloc<
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferState> {
  final Repositories _repositories = Repositories();

  TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc()
      : super(
            const TrainingOfferResponseDynamicWithDistanceByTrainingOfferState(
                status: StatusWithoutLoading.initial)) {
    on<LoadTrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent>(
        _onLoadTrainingOfferResponseDynamicWithDistanceByTrainingOffer);
    on<CleanTrainingOfferResponseDynamicWithDistanceByTrainingOffer>(
        _onCleanTrainingOfferResponseDynamicWithDistanceByTrainingOffer);
  }

  FutureOr<void> _onLoadTrainingOfferResponseDynamicWithDistanceByTrainingOffer(
      event,
      Emitter<TrainingOfferResponseDynamicWithDistanceByTrainingOfferState>
          emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses =
            await _repositories
                .getTrainingOfferResponseDynamicWithDistanceDataByTrainingOffer(
                    event.trainingOfferId, event.offset);
        return trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses
                    .isEmpty ||
                trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferResponseDynamicWithDistanceList:
                    trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferResponseDynamicWithDistanceList:
                    trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses,
                hasReachedMax: false));
      }
      final trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses =
          await _repositories
              .getTrainingOfferResponseDynamicWithDistanceDataByTrainingOffer(
                  event.trainingOfferId, event.offset);
      trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses
                  .isEmpty ||
              trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferResponseDynamicWithDistanceList: List.of(
                  state.trainingOfferResponseDynamicWithDistanceList)
                ..addAll(
                    trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferResponseDynamicWithDistanceList: List.of(
                  state.trainingOfferResponseDynamicWithDistanceList)
                ..addAll(
                    trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses),
              hasReachedMax: false,
            ));
    } catch (e) {
      TrainingOfferResponseDynamicWithDistanceByTrainingOfferState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanTrainingOfferResponseDynamicWithDistanceByTrainingOffer(
      CleanTrainingOfferResponseDynamicWithDistanceByTrainingOffer event,
      Emitter<TrainingOfferResponseDynamicWithDistanceByTrainingOfferState>
          emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        trainingOfferResponseDynamicWithDistanceList: List.of(
            state.trainingOfferResponseDynamicWithDistanceList..clear()),
        hasReachedMax: false));
  }
}


  // FutureOr<void> _onLoadTrainingOfferResponseDynamicWithDistanceByTrainingOffer(
  //     event,
  //     Emitter<TrainingOfferResponseDynamicWithDistanceByTrainingOfferState>
  //         emit) async {
  //   emit(const TrainingOfferResponseDynamicWithDistanceByTrainingOfferState(
  //       status: Status.loading));

  //   try {
  //     final trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses =
  //         await _repositories
  //             .getTrainingOfferResponseDynamicWithDistanceDataByTrainingOffer(
  //                 event.trainingOfferId);
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           trainingOfferResponseDynamicWithDistanceByTrainingOfferList:
  //               trainingOfferResponseDynamicWithDistanceByTrainingOfferListResponses),
  //     );
  //   } catch (e) {
  //     TrainingOfferResponseDynamicWithDistanceByTrainingOfferState(
  //         status: Status.failure, error: e.toString());
  //   }
  // }