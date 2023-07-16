part of 'attended_activity_by_attendee_bloc.dart';

class AttendedActivityByAttendeeState extends Equatable {
  final List<ContentNumber?> attendedActivityByAttendeeList;
  final String error;
  final Status status;

  const AttendedActivityByAttendeeState({
    this.attendedActivityByAttendeeList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  AttendedActivityByAttendeeState copyWith({
    List<ContentNumber?>? attendedActivityByAttendeeList,
    String? error,
    Status? status,
  }) {
    return AttendedActivityByAttendeeState(
      attendedActivityByAttendeeList:
          attendedActivityByAttendeeList ?? this.attendedActivityByAttendeeList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [attendedActivityByAttendeeList, error, status];

  @override
  String toString() =>
      'AttendedActivityByAttendeeState(attendedActivityByAttendeeList: $attendedActivityByAttendeeList, error: $error, status: $status)';
}
