import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_response_dynamic_by_chosen_attributes_event.dart';
part 'training_request_response_dynamic_by_chosen_attributes_state.dart';

class TrainingRequestResponseDynamicByChosenAttributesBloc extends Bloc<
    TrainingRequestResponseDynamicByChosenAttributesEvent,
    TrainingRequestResponseDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  TrainingRequestResponseDynamicByChosenAttributesBloc()
      : super(const TrainingRequestResponseDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadTrainingRequestResponseDynamicByChosenAttributesEvent>(
        _onLoadTrainingRequestResponseDynamicByChosenAttributes);
  }

  FutureOr<void> _onLoadTrainingRequestResponseDynamicByChosenAttributes(
      event,
      Emitter<TrainingRequestResponseDynamicByChosenAttributesState>
          emit) async {
    emit(const TrainingRequestResponseDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final trainingRequestResponseDynamicByChosenAttributesListResponses =
          await _repositories
              .getTrainingRequestResponseDynamicDataByChosenAttributes(
                  event.trainingRequestId, event.coachId);
      emit(
        state.copyWith(
            status: Status.success,
            trainingRequestResponseDynamicList:
                trainingRequestResponseDynamicByChosenAttributesListResponses),
      );
    } catch (e) {
      TrainingRequestResponseDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
