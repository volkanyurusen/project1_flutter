part of 'attended_activity_by_attendee_bloc.dart';

abstract class AttendedActivityByAttendeeEvent extends Equatable {
  const AttendedActivityByAttendeeEvent();

  @override
  List<Object> get props => [];
}

class LoadAttendedActivityByAttendeeEvent
    extends AttendedActivityByAttendeeEvent {
  final int attendeeId;

  const LoadAttendedActivityByAttendeeEvent({required this.attendeeId});

  @override
  List<Object> get props => [attendeeId];
}

class RecallAttendedActivityByAttendeeEvent
    extends AttendedActivityByAttendeeEvent {}

