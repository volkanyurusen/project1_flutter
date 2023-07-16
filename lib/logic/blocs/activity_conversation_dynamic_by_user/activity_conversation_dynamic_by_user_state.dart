part of 'activity_conversation_dynamic_by_user_bloc.dart';

class ActivityConversationDynamicByUserState extends Equatable {
  final List<ActivityConversationDynamic> activityConversationDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const ActivityConversationDynamicByUserState({
    this.activityConversationDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  ActivityConversationDynamicByUserState copyWith({
    List<ActivityConversationDynamic>? activityConversationDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return ActivityConversationDynamicByUserState(
      activityConversationDynamicList: activityConversationDynamicList ??
          this.activityConversationDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [activityConversationDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'ActivityConversationDynamicByUserState(ActivityConversationDynamicList: $activityConversationDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
