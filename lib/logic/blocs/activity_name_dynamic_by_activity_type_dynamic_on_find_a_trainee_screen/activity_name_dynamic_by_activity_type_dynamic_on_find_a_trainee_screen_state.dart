part of 'activity_name_dynamic_by_activity_type_dynamic_on_find_a_trainee_screen_bloc.dart';

class ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState
    extends Equatable {
  final List<ActivityNameDynamic> activityNameDynamicList;
  final String error;
  final Status status;

  const ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState({
    this.activityNameDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState copyWith({
    List<ActivityNameDynamic>? activityNameDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState(
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
      'ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState(activityNameDynamicList: $activityNameDynamicList, error: $error, status: $status)';
}
