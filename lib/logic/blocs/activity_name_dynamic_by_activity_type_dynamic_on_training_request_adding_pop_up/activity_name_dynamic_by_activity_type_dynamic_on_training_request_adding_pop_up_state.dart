part of 'activity_name_dynamic_by_activity_type_dynamic_on_training_request_adding_pop_up_bloc.dart';

class ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
    extends Equatable {
  final List<ActivityNameDynamic> activityNameDynamicList;
  final String error;
  final Status status;

  const ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState({
    this.activityNameDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
      copyWith({
    List<ActivityNameDynamic>? activityNameDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState(
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
      'ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState(activityNameDynamicList: $activityNameDynamicList, error: $error, status: $status)';
}
