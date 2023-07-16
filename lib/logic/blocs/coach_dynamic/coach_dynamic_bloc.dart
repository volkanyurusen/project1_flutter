import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'coach_dynamic_event.dart';
part 'coach_dynamic_state.dart';

class CoachDynamicBloc extends Bloc<CoachDynamicEvent, CoachDynamicState> {
  final Repositories _repositories = Repositories();
  //
  // final CoachDynamicRepository _coachDynamicRepository =
  //     CoachDynamicRepository();

  CoachDynamicBloc() : super(const CoachDynamicState(status: Status.initial)) {
    on<LoadCoachDynamicEvent>(_onLoadCoachDynamic);
    on<RecallCoachDynamicEvent>(_onRecallCoachDynamicEvent);
  }

  FutureOr<void> _onLoadCoachDynamic(
      event, Emitter<CoachDynamicState> emit) async {
    emit(const CoachDynamicState(status: Status.loading));

    try {
      final coachDynamicListResponses =
          await _repositories.getCoachDynamicData(event.coachId);
      //
      // await _coachDynamicRepository.getCoachDynamicData(event.coachId);
      //
      // if (kDebugMode) {
      //   print(
      //       'CoachDynamicListResponses: $CoachDynamicListResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            coachDynamicList: coachDynamicListResponses),
      );
    } catch (e) {
      CoachDynamicState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallCoachDynamicEvent(
      RecallCoachDynamicEvent event, Emitter<CoachDynamicState> emit) {
    //
    //print('before ${state.status}');
    emit(state.copyWith(
        status: Status.initial,
        coachDynamicList: List.from(state.coachDynamicList..clear())));
    //
    //print('after ${state.status}');
  }
}
