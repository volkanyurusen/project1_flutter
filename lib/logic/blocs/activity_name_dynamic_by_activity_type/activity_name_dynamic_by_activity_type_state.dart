part of 'activity_name_dynamic_by_activity_type_bloc.dart';

class ActivityNameDynamicByActivityTypeState extends Equatable {
  final List<ActivityNameDynamic> activityNameDynamicList;
  final String error;
  final Status status;

  const ActivityNameDynamicByActivityTypeState({
    this.activityNameDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityNameDynamicByActivityTypeState copyWith({
    List<ActivityNameDynamic>? activityNameDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityNameDynamicByActivityTypeState(
      activityNameDynamicList:
          activityNameDynamicList ??
              this.activityNameDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [activityNameDynamicList, error, status];

  @override
  String toString() =>
      'ActivityNameDynamicByActivityTypeState(activityNameDynamicList: $activityNameDynamicList, error: $error, status: $status)';
}
