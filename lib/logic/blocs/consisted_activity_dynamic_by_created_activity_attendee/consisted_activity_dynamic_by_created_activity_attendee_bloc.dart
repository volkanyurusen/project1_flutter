import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'consisted_activity_dynamic_by_created_activity_attendee_event.dart';
part 'consisted_activity_dynamic_by_created_activity_attendee_state.dart';

class ConsistedActivityDynamicByCreatedActivityAttendeeBloc extends Bloc<
    ConsistedActivityDynamicByCreatedActivityAttendeeEvent,
    ConsistedActivityDynamicByCreatedActivityAttendeeState> {
  final Repositories _repositories = Repositories();

  ConsistedActivityDynamicByCreatedActivityAttendeeBloc()
      : super(const ConsistedActivityDynamicByCreatedActivityAttendeeState(
            status: Status.initial)) {
    on<LoadConsistedActivityDynamicByCreatedActivityAttendeeEvent>(
        _onLoadConsistedActivityDynamicByCreatedActivityAttendee);
  }

  FutureOr<void> _onLoadConsistedActivityDynamicByCreatedActivityAttendee(
      event,
      Emitter<ConsistedActivityDynamicByCreatedActivityAttendeeState>
          emit) async {
    emit(const ConsistedActivityDynamicByCreatedActivityAttendeeState(
        status: Status.loading));

    try {
      final consistedActivityDynamicByCreatedActivityAttendeeListResponses =
          await _repositories
              .getConsistedActivityDynamicDataByCreatedActivityAttendee(
                  event.createdActivityId, event.attendeeId);
      emit(
        state.copyWith(
            status: Status.success,
            consistedActivityDynamicList:
                consistedActivityDynamicByCreatedActivityAttendeeListResponses),
      );
    } catch (e) {
      ConsistedActivityDynamicByCreatedActivityAttendeeState(
          status: Status.failure, error: e.toString());
    }
  }
}
