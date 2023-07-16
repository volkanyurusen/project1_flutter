import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'coaching_experience_dynamic_by_chosen_attributes_event.dart';
part 'coaching_experience_dynamic_by_chosen_attributes_state.dart';

class CoachingExperienceDynamicByChosenAttributesBloc extends Bloc<
    CoachingExperienceDynamicByChosenAttributesEvent,
    CoachingExperienceDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  CoachingExperienceDynamicByChosenAttributesBloc()
      : super(const CoachingExperienceDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadCoachingExperienceDynamicByChosenAttributesEvent>(
        onLoadCoachingExperienceDynamic);
  }

  FutureOr<void> onLoadCoachingExperienceDynamic(event,
      Emitter<CoachingExperienceDynamicByChosenAttributesState> emit) async {
    emit(const CoachingExperienceDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final allCoachingExperienceDynamicResponses =
          await _repositories.getCoachingExperienceDynamicByChosenAttributes(
              event.coachingExperienceYearId);

      emit(state.copyWith(
          status: Status.success,
          coachingExperienceDynamicList:
              allCoachingExperienceDynamicResponses));
    } catch (e) {
      CoachingExperienceDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
