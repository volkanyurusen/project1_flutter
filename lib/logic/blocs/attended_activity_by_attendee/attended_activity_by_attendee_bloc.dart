import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
// import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'attended_activity_by_attendee_event.dart';
part 'attended_activity_by_attendee_state.dart';

class AttendedActivityByAttendeeBloc extends Bloc<
    AttendedActivityByAttendeeEvent, AttendedActivityByAttendeeState> {
  final Repositories _repositories = Repositories();

  AttendedActivityByAttendeeBloc()
      : super(const AttendedActivityByAttendeeState(status: Status.initial)) {
    on<LoadAttendedActivityByAttendeeEvent>(
        _onLoadConsistedActivityDynamicWithDistanceAttendedByUser);
    on<RecallAttendedActivityByAttendeeEvent>(
        _onRecallConsistedActivityDynamicWithDistanceAttendedByUser);
  }

  FutureOr<void> _onLoadConsistedActivityDynamicWithDistanceAttendedByUser(
      event, Emitter<AttendedActivityByAttendeeState> emit) async {
    emit(const AttendedActivityByAttendeeState(status: Status.loading));

    try {
      final response = await _repositories
          .getAttendedActivityDataByAttendee(event.attendeeId);
      emit(state.copyWith(
        status: Status.success,
        attendedActivityByAttendeeList: response,
      ));
    } catch (e) {
      AttendedActivityByAttendeeState(
          status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallConsistedActivityDynamicWithDistanceAttendedByUser(
      RecallAttendedActivityByAttendeeEvent event,
      Emitter<AttendedActivityByAttendeeState> emit) {
    emit(state.copyWith(
        status: Status.success,
        attendedActivityByAttendeeList:
            List.of(state.attendedActivityByAttendeeList)..clear()));
    print(state.attendedActivityByAttendeeList);
  }
}
