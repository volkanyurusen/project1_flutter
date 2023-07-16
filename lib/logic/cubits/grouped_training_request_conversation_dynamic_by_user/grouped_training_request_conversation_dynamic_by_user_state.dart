part of 'grouped_training_request_conversation_dynamic_by_user_cubit.dart';

class GroupedTrainingRequestConversationDynamicByUserState extends Equatable {
  final List<TrainingRequestConversationDynamic>
      groupedTrainingRequestConversationDynamicList;

  const GroupedTrainingRequestConversationDynamicByUserState({
    required this.groupedTrainingRequestConversationDynamicList,
  });

  GroupedTrainingRequestConversationDynamicByUserState copyWith({
    List<TrainingRequestConversationDynamic>?
        groupedTrainingRequestConversationDynamicList,
  }) {
    return GroupedTrainingRequestConversationDynamicByUserState(
      groupedTrainingRequestConversationDynamicList:
          groupedTrainingRequestConversationDynamicList ??
              this.groupedTrainingRequestConversationDynamicList,
    );
  }

  @override
  List<Object> get props => [groupedTrainingRequestConversationDynamicList];
}
