part of 'consisted_activity_dynamic_by_created_activity_attendee_bloc.dart';

abstract class ConsistedActivityDynamicByCreatedActivityAttendeeEvent
    extends Equatable {
  const ConsistedActivityDynamicByCreatedActivityAttendeeEvent();

  @override
  List<Object> get props => [];
}

class LoadConsistedActivityDynamicByCreatedActivityAttendeeEvent
    extends ConsistedActivityDynamicByCreatedActivityAttendeeEvent {
  final int createdActivityId;
  final int attendeeId;

  const LoadConsistedActivityDynamicByCreatedActivityAttendeeEvent({
    required this.createdActivityId,
    required this.attendeeId,
  });

  @override
  List<Object> get props => [createdActivityId, attendeeId];
}
