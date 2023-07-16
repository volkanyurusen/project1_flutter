part of 'activity_name_dynamic_by_activity_type_dynamic_on_create_activity_screen_bloc.dart';

class ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenState
    extends Equatable {
  final List<ActivityNameDynamic> activityNameDynamicList;
  final String error;
  final Status status;

  const ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenState({
    this.activityNameDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenState copyWith({
    List<ActivityNameDynamic>? activityNameDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenState(
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
      'ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenState(activityNameDynamicList: $activityNameDynamicList, error: $error, status: $status)';
}
