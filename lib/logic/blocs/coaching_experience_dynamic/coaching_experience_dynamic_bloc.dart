import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'coaching_experience_dynamic_event.dart';
part 'coaching_experience_dynamic_state.dart';

class CoachingExperienceDynamicBloc extends Bloc<CoachingExperienceDynamicEvent,
    CoachingExperienceDynamicState> {
  final Repositories _repositories = Repositories();
  //
  // final CoachingExperienceDynamicRepository
  //     _coachingExperienceDynamicRepository =
  //     CoachingExperienceDynamicRepository();

  CoachingExperienceDynamicBloc()
      : super(const CoachingExperienceDynamicState(status: Status.initial)) {
    on<LoadCoachingExperienceDynamicEvent>(_onLoadCoachingExperienceDynamic);
  }

  FutureOr<void> _onLoadCoachingExperienceDynamic(
      event, Emitter<CoachingExperienceDynamicState> emit) async {
    emit(const CoachingExperienceDynamicState(status: Status.loading));

    try {
      final allCoachingExperienceDynamicResponses =
          await _repositories.getAllCoachingExperienceDynamicData();
      //
      // await _coachingExperienceDynamicRepository
      //     .getCoachingExperienceDynamics();
      //
      // if (kDebugMode) {
      //   print('allCoachingExperienceDynamicResponses: $allCoachingExperienceDynamicResponses');
      // }
      emit(state.copyWith(
          status: Status.success,
          coachingExperienceDynamicList:
              allCoachingExperienceDynamicResponses));
    } catch (e) {
      CoachingExperienceDynamicState(
          status: Status.failure, error: e.toString());
    }
  }
}
