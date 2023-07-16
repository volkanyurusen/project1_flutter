part of 'activity_name_dynamic_by_chosen_attributes_bloc.dart';

class ActivityNameDynamicByChosenAttributesState extends Equatable {
  final List<ActivityNameDynamic> activityNameDynamicList;
  final String error;
  final Status status;

  const ActivityNameDynamicByChosenAttributesState({
    this.activityNameDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityNameDynamicByChosenAttributesState copyWith({
    List<ActivityNameDynamic>? activityNameDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityNameDynamicByChosenAttributesState(
      activityNameDynamicList:
          activityNameDynamicList ?? this.activityNameDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [activityNameDynamicList, error, status];

  @override
  String toString() =>
      'ActivityNameDynamicByChosenAttributesState(activityNameDynamicList: $activityNameDynamicList, error: $error, status: $status)';
}
