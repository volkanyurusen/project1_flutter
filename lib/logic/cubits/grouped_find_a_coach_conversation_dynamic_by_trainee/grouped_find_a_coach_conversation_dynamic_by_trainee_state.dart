part of 'grouped_find_a_coach_conversation_dynamic_by_trainee_cubit.dart';

class GroupedFindACoachConversationDynamicByTraineeState extends Equatable {
  final List<TrainingOfferConversationDynamic>
      groupedFindACoachConversationDynamicList;

  const GroupedFindACoachConversationDynamicByTraineeState({
    required this.groupedFindACoachConversationDynamicList,
  });

  GroupedFindACoachConversationDynamicByTraineeState copyWith({
    List<TrainingOfferConversationDynamic>?
        groupedFindACoachConversationDynamicList,
  }) {
    return GroupedFindACoachConversationDynamicByTraineeState(
      groupedFindACoachConversationDynamicList:
          groupedFindACoachConversationDynamicList ??
              this.groupedFindACoachConversationDynamicList,
    );
  }

  @override
  List<Object> get props => [groupedFindACoachConversationDynamicList];
}
