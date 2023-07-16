import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_detail_dynamic_by_chosen_attributes_event.dart';
part 'training_detail_dynamic_by_chosen_attributes_state.dart';

class TrainingDetailDynamicByChosenAttributesBloc extends Bloc<
    TrainingDetailDynamicByChosenAttributesEvent,
    TrainingDetailDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  TrainingDetailDynamicByChosenAttributesBloc()
      : super(const TrainingDetailDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadTrainingDetailDynamicByChosenAttributesEvent>(
        onLoadActivityDetailDynamic);
  }

  FutureOr<void> onLoadActivityDetailDynamic(
      event, Emitter<TrainingDetailDynamicByChosenAttributesState> emit) async {
    emit(const TrainingDetailDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      // This code added not to be crashed the app, or not to emit different activityDetailDynamic model in the state of trainingDetailDynamicList.It should be checked!!!
      if (state.trainingDetailDynamicList.isNotEmpty) {
        state.copyWith(
            trainingDetailDynamicList: List.of(state.trainingDetailDynamicList)
              ..clear());
      }

      final allActivityDetailDynamicResponses =
          await _repositories.getTrainingDetailDynamicDataByChosenAttributes(
        event.activityNameId,
      );

      emit(state.copyWith(
          status: Status.success,
          trainingDetailDynamicList: allActivityDetailDynamicResponses));
    } catch (e) {
      TrainingDetailDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
