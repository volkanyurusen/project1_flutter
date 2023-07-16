import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_response_event.dart';
part 'training_offer_response_state.dart';

class TrainingOfferResponseBloc
    extends Bloc<TrainingOfferResponseEvent, TrainingOfferResponseState> {
  final Repositories _repositories = Repositories();

  TrainingOfferResponseBloc()
      : super(const TrainingOfferResponseState(status: Status.initial)) {
    on<AddTrainingOfferResponseEvent>(_onAddTrainingOfferResponseEvent);
    on<UpdateTrainingOfferResponseEvent>(_onUpdateTrainingOfferResponseEvent);
    on<DeleteTrainingOfferResponseEvent>(_onDeleteTrainingOfferResponseEvent);
  }

  FutureOr<void> _onAddTrainingOfferResponseEvent(
      event, Emitter<TrainingOfferResponseState> emit) async {
    emit(const TrainingOfferResponseState(status: Status.loading));

    try {
      final allTrainingOfferResponseResponses =
          await _repositories.postTrainingOfferResponse(event.trainingOfferResponse);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingOfferResponseResponses));
    } catch (e) {
      TrainingOfferResponseState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateTrainingOfferResponseEvent(
      event, Emitter<TrainingOfferResponseState> emit) async {
    emit(const TrainingOfferResponseState(status: Status.loading));

    try {
      final allTrainingOfferResponseResponses =
          await _repositories.putTrainingOfferResponse(event.trainingOfferResponse);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingOfferResponseResponses));
    } catch (e) {
      TrainingOfferResponseState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteTrainingOfferResponseEvent(
      event, Emitter<TrainingOfferResponseState> emit) async {
    emit(const TrainingOfferResponseState(status: Status.loading));

    try {
      final allTrainingOfferResponseResponses =
          await _repositories.deleteTrainingOfferResponse(event.trainingOfferResponseId);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingOfferResponseResponses));
    } catch (e) {
      TrainingOfferResponseState(status: Status.failure, error: e.toString());
    }
  }
}
