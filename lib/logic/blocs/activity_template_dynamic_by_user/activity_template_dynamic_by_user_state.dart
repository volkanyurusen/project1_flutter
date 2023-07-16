part of 'activity_template_dynamic_by_user_bloc.dart';

class ActivityTemplateDynamicByUserState extends Equatable {
  final List<ActivityTemplateDynamic> activityTemplateDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const ActivityTemplateDynamicByUserState({
    this.activityTemplateDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  ActivityTemplateDynamicByUserState copyWith({
    List<ActivityTemplateDynamic>? activityTemplateDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return ActivityTemplateDynamicByUserState(
      activityTemplateDynamicList:
          activityTemplateDynamicList ?? this.activityTemplateDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [activityTemplateDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'ActivityTemplateDynamicByUserState(activityTemplateDynamicList: $activityTemplateDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
