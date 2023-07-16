import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_event.dart';
part 'training_offer_state.dart';

class TrainingOfferBloc extends Bloc<TrainingOfferEvent, TrainingOfferState> {
  final Repositories _repositories = Repositories();

  TrainingOfferBloc()
      : super(const TrainingOfferState(status: Status.initial)) {
    on<AddTrainingOfferEvent>(_onAddTrainingOfferEvent);
    on<UpdateTrainingOfferEvent>(_onUpdateTrainingOfferEvent);
    on<DeleteTrainingOfferEvent>(_onDeleteTrainingOfferEvent);
  }

  FutureOr<void> _onAddTrainingOfferEvent(
      event, Emitter<TrainingOfferState> emit) async {
    emit(const TrainingOfferState(status: Status.loading));

    try {
      final allTrainingOfferResponses =
          await _repositories.postTrainingOffer(event.trainingOffer);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingOfferResponses));
    } catch (e) {
      TrainingOfferState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateTrainingOfferEvent(
      event, Emitter<TrainingOfferState> emit) async {
    emit(const TrainingOfferState(status: Status.loading));

    try {
      final allTrainingOfferResponses =
          await _repositories.putTrainingOffer(event.trainingOffer);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingOfferResponses));
    } catch (e) {
      TrainingOfferState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteTrainingOfferEvent(
      event, Emitter<TrainingOfferState> emit) async {
    emit(const TrainingOfferState(status: Status.loading));

    try {
      final allTrainingOfferResponses =
          await _repositories.deleteTrainingOffer(event.trainingOfferId);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingOfferResponses));
    } catch (e) {
      TrainingOfferState(status: Status.failure, error: e.toString());
    }
  }
}
