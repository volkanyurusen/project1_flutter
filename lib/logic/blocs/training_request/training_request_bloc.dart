import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_event.dart';
part 'training_request_state.dart';

class TrainingRequestBloc extends Bloc<TrainingRequestEvent, TrainingRequestState> {
  final Repositories _repositories = Repositories();

  TrainingRequestBloc()
      : super(const TrainingRequestState(status: Status.initial)) {
    on<AddTrainingRequestEvent>(_onAddTrainingRequestEvent);
    on<UpdateTrainingRequestEvent>(_onUpdateTrainingRequestEvent);
    on<DeleteTrainingRequestEvent>(_onDeleteTrainingRequestEvent);
  }

  FutureOr<void> _onAddTrainingRequestEvent(
      event, Emitter<TrainingRequestState> emit) async {
    emit(const TrainingRequestState(status: Status.loading));

    try {
      final allTrainingRequestResponses =
          await _repositories.postTrainingRequest(event.trainingRequest);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingRequestResponses));
    } catch (e) {
      TrainingRequestState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateTrainingRequestEvent(
      event, Emitter<TrainingRequestState> emit) async {
    emit(const TrainingRequestState(status: Status.loading));

    try {
      final allTrainingRequestResponses =
          await _repositories.putTrainingRequest(event.trainingRequest);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingRequestResponses));
    } catch (e) {
      TrainingRequestState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteTrainingRequestEvent(
      event, Emitter<TrainingRequestState> emit) async {
    emit(const TrainingRequestState(status: Status.loading));

    try {
      final allTrainingRequestResponses =
          await _repositories.deleteTrainingRequest(event.trainingRequestId);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingRequestResponses));
    } catch (e) {
      TrainingRequestState(status: Status.failure, error: e.toString());
    }
  }
}
