part of 'activity_conversation_dynamic_by_chosen_attributes_bloc.dart';

class ActivityConversationDynamicByChosenAttributesState extends Equatable {
  final List<ActivityConversationDynamic> activityConversationDynamicList;
  final String error;
  final Status status;

  const ActivityConversationDynamicByChosenAttributesState({
    this.activityConversationDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityConversationDynamicByChosenAttributesState copyWith({
    List<ActivityConversationDynamic>? activityConversationDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityConversationDynamicByChosenAttributesState(
      activityConversationDynamicList: activityConversationDynamicList ??
          this.activityConversationDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [activityConversationDynamicList, error, status];

  @override
  String toString() =>
      'ActivityConversationDynamicByChosenAttributesState(activityConversationDynamicList: $activityConversationDynamicList, error: $error, status: $status)';
}
