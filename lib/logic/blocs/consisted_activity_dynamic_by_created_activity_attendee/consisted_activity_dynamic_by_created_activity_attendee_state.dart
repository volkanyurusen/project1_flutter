part of 'consisted_activity_dynamic_by_created_activity_attendee_bloc.dart';

class ConsistedActivityDynamicByCreatedActivityAttendeeState extends Equatable {
  final List<ConsistedActivityDynamic> consistedActivityDynamicList;
  final String error;
  final Status status;

  const ConsistedActivityDynamicByCreatedActivityAttendeeState({
    this.consistedActivityDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ConsistedActivityDynamicByCreatedActivityAttendeeState copyWith({
    List<ConsistedActivityDynamic>? consistedActivityDynamicList,
    String? error,
    Status? status,
  }) {
    return ConsistedActivityDynamicByCreatedActivityAttendeeState(
      consistedActivityDynamicList:
          consistedActivityDynamicList ?? this.consistedActivityDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [consistedActivityDynamicList, error, status];

  @override
  String toString() =>
      'ConsistedActivityDynamicByCreatedActivityAttendeeState(consistedActivityDynamicList: $consistedActivityDynamicList, error: $error, status: $status)';
}
