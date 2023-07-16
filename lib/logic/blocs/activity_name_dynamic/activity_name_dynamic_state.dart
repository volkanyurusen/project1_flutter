part of 'activity_name_dynamic_bloc.dart';

class ActivityNameDynamicState extends Equatable {
  final List<ActivityNameDynamic> activityNameDynamicList;
  final String error;
  final Status status;

  const ActivityNameDynamicState({
    this.activityNameDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityNameDynamicState copyWith({
    List<ActivityNameDynamic>? activityNameDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityNameDynamicState(
      activityNameDynamicList: activityNameDynamicList ?? this.activityNameDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [activityNameDynamicList, error, status];

  @override
  String toString() =>
      'ActivityNameDynamicState(activityNameDynamicList: $activityNameDynamicList, error: $error, status: $status)';
}
