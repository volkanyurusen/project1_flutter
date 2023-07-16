import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_response_event.dart';
part 'training_request_response_state.dart';

class TrainingRequestResponseBloc
    extends Bloc<TrainingRequestResponseEvent, TrainingRequestResponseState> {
  final Repositories _repositories = Repositories();

  TrainingRequestResponseBloc()
      : super(const TrainingRequestResponseState(status: Status.initial)) {
    on<AddTrainingRequestResponseEvent>(_onAddTrainingRequestResponseEvent);
    on<UpdateTrainingRequestResponseEvent>(_onUpdateTrainingRequestResponseEvent);
    on<DeleteTrainingRequestResponseEvent>(_onDeleteTrainingRequestResponseEvent);
  }

  FutureOr<void> _onAddTrainingRequestResponseEvent(
      event, Emitter<TrainingRequestResponseState> emit) async {
    emit(const TrainingRequestResponseState(status: Status.loading));

    try {
      final allTrainingRequestResponseResponses =
          await _repositories.postTrainingRequestResponse(event.trainingRequestResponse);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingRequestResponseResponses));
    } catch (e) {
      TrainingRequestResponseState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateTrainingRequestResponseEvent(
      event, Emitter<TrainingRequestResponseState> emit) async {
    emit(const TrainingRequestResponseState(status: Status.loading));

    try {
      final allTrainingRequestResponseResponses =
          await _repositories.putTrainingRequestResponse(event.trainingRequestResponse);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingRequestResponseResponses));
    } catch (e) {
      TrainingRequestResponseState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteTrainingRequestResponseEvent(
      event, Emitter<TrainingRequestResponseState> emit) async {
    emit(const TrainingRequestResponseState(status: Status.loading));

    try {
      final allTrainingRequestResponseResponses =
          await _repositories.deleteTrainingRequestResponse(event.trainingRequestResponseId);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allTrainingRequestResponseResponses));
    } catch (e) {
      TrainingRequestResponseState(status: Status.failure, error: e.toString());
    }
  }
}
