part of 'activity_type_dynamic_bloc.dart';

class ActivityTypeDynamicState extends Equatable {
  final List<ActivityTypeDynamic> activityTypeDynamicList;
  final String error;
  final Status status;

  const ActivityTypeDynamicState({
    this.activityTypeDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityTypeDynamicState copyWith({
    List<ActivityTypeDynamic>? activityTypeDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityTypeDynamicState(
      activityTypeDynamicList: activityTypeDynamicList ?? this.activityTypeDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [activityTypeDynamicList, error, status];

  @override
  String toString() =>
      'ActivityTypeDynamicState(activityTypeDynamicList: $activityTypeDynamicList, error: $error, status: $status)';
}
