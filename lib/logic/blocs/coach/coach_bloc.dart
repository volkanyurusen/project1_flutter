import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'coach_event.dart';
part 'coach_state.dart';

class CoachBloc extends Bloc<CoachEvent, CoachState> {
  final Repositories _repositories = Repositories();
  //
  // final CoachRepository _coachRepository =
  //     CoachRepository();

  CoachBloc() : super(const CoachState(status: Status.initial)) {
    on<LoadCoachEvent>(_onLoadCoach);
    on<RecallCoachEvent>(_onRecallCoachEvent);
  }

  FutureOr<void> _onLoadCoach(event, Emitter<CoachState> emit) async {
    emit(const CoachState(status: Status.loading));

    try {
      final coachListResponses =
          await _repositories.getCoachData(event.coachId);
      //
      // await _coachRepository.getCoachData(event.coachId);
      //
      // if (kDebugMode) {
      //   print(
      //       'CoachListResponses: $CoachListResponses');
      // }
      emit(
        state.copyWith(status: Status.success, coachList: coachListResponses),
      );
    } catch (e) {
      CoachState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallCoachEvent(
      RecallCoachEvent event, Emitter<CoachState> emit) {
    //
    //print('before ${state.status}');
    emit(state.copyWith(
        status: Status.initial,
        coachList: List.from(state.coachList..clear())));
    //
    //print('after ${state.status}');
  }
}
