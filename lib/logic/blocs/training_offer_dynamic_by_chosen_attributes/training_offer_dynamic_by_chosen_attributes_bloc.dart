import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_dynamic_by_chosen_attributes_event.dart';
part 'training_offer_dynamic_by_chosen_attributes_state.dart';

class TrainingOfferDynamicByChosenAttributesBloc extends Bloc<
    TrainingOfferDynamicByChosenAttributesEvent,
    TrainingOfferDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  TrainingOfferDynamicByChosenAttributesBloc()
      : super(const TrainingOfferDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadTrainingOfferDynamicByChosenAttributesEvent>(
        onLoadTrainingOfferDynamic);
  }

  FutureOr<void> onLoadTrainingOfferDynamic(
      event, Emitter<TrainingOfferDynamicByChosenAttributesState> emit) async {
    emit(const TrainingOfferDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final allTrainingOfferDynamicResponses =
          await _repositories.getTrainingOfferDynamicDataByChosenAttributes(
              event.coachId,
              event.trainingDetailId,
              event.coachingLocationDetailId);

      emit(state.copyWith(
          status: Status.success,
          trainingOfferDynamicList: allTrainingOfferDynamicResponses));
    } catch (e) {
      TrainingOfferDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
