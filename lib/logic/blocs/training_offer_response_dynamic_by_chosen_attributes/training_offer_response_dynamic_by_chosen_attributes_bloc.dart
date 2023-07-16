import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_response_dynamic_by_chosen_attributes_event.dart';
part 'training_offer_response_dynamic_by_chosen_attributes_state.dart';

class TrainingOfferResponseDynamicByChosenAttributesBloc extends Bloc<
    TrainingOfferResponseDynamicByChosenAttributesEvent,
    TrainingOfferResponseDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  TrainingOfferResponseDynamicByChosenAttributesBloc()
      : super(const TrainingOfferResponseDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadTrainingOfferResponseDynamicByChosenAttributesEvent>(
        _onLoadTrainingOfferResponseDynamicByChosenAttributes);
  }

  FutureOr<void> _onLoadTrainingOfferResponseDynamicByChosenAttributes(event,
      Emitter<TrainingOfferResponseDynamicByChosenAttributesState> emit) async {
    emit(const TrainingOfferResponseDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final trainingOfferResponseDynamicByChosenAttributesListResponses =
          await _repositories
              .getTrainingOfferResponseDynamicDataByChosenAttributes(
                  event.trainingOfferId, event.traineeId);
      emit(
        state.copyWith(
            status: Status.success,
            trainingOfferResponseDynamicList:
                trainingOfferResponseDynamicByChosenAttributesListResponses),
      );
    } catch (e) {
      TrainingOfferResponseDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
