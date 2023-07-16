part of 'activity_name_dynamic_by_activity_type_dynamic_on_activity_template_adding_pop_up_bloc.dart';

class ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
    extends Equatable {
  final List<ActivityNameDynamic> activityNameDynamicList;
  final String error;
  final Status status;

  const ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState({
    this.activityNameDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
      copyWith({
    List<ActivityNameDynamic>? activityNameDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState(
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
      'ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState(activityNameDynamicList: $activityNameDynamicList, error: $error, status: $status)';
}
