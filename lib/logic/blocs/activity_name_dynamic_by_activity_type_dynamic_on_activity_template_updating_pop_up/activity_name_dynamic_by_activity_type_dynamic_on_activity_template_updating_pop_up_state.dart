part of 'activity_name_dynamic_by_activity_type_dynamic_on_activity_template_updating_pop_up_bloc.dart';

class ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
    extends Equatable {
  final List<ActivityNameDynamic> activityNameDynamicList;
  final String error;
  final Status status;

  const ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState({
    this.activityNameDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
      copyWith({
    List<ActivityNameDynamic>? activityNameDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState(
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
      'ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState(activityNameDynamicList: $activityNameDynamicList, error: $error, status: $status)';
}
