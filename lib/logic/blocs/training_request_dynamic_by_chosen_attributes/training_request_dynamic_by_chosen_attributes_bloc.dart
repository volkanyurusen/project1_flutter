import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_dynamic_by_chosen_attributes_event.dart';
part 'training_request_dynamic_by_chosen_attributes_state.dart';

class TrainingRequestDynamicByChosenAttributesBloc extends Bloc<
    TrainingRequestDynamicByChosenAttributesEvent,
    TrainingRequestDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  TrainingRequestDynamicByChosenAttributesBloc()
      : super(const TrainingRequestDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadTrainingRequestDynamicByChosenAttributesEvent>(
        onLoadTrainingRequestDynamic);
  }

  FutureOr<void> onLoadTrainingRequestDynamic(event,
      Emitter<TrainingRequestDynamicByChosenAttributesState> emit) async {
    emit(const TrainingRequestDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final allTrainingRequestDynamicResponses =
          await _repositories.getTrainingRequestDynamicDataByChosenAttributes(
              event.trainingRequesterId,
              event.trainingDetailId,
              event.locationDetailId);

      emit(state.copyWith(
          status: Status.success,
          trainingRequestDynamicList: allTrainingRequestDynamicResponses));
    } catch (e) {
      TrainingRequestDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
