part of 'grouped_training_offer_conversation_dynamic_by_user_cubit.dart';

class GroupedTrainingOfferConversationDynamicByUserState extends Equatable {
  final List<TrainingOfferConversationDynamic>
      groupedTrainingOfferConversationDynamicList;

  const GroupedTrainingOfferConversationDynamicByUserState({
    required this.groupedTrainingOfferConversationDynamicList,
  });

  GroupedTrainingOfferConversationDynamicByUserState copyWith({
    List<TrainingOfferConversationDynamic>?
        groupedTrainingOfferConversationDynamicList,
  }) {
    return GroupedTrainingOfferConversationDynamicByUserState(
      groupedTrainingOfferConversationDynamicList:
          groupedTrainingOfferConversationDynamicList ??
              this.groupedTrainingOfferConversationDynamicList,
    );
  }

  @override
  List<Object> get props => [groupedTrainingOfferConversationDynamicList];
}
