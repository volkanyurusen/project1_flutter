part of 'chosen_find_a_coach_conversation_dynamic_by_trainee_cubit.dart';

class ChosenFindACoachConversationDynamicByTraineeState extends Equatable {
  final List<TrainingOfferConversationDynamic>
      chosenFindACoachConversationDynamicList;

  const ChosenFindACoachConversationDynamicByTraineeState({
    required this.chosenFindACoachConversationDynamicList,
  });

  ChosenFindACoachConversationDynamicByTraineeState copyWith({
    List<TrainingOfferConversationDynamic>?
        chosenFindACoachConversationDynamicList,
  }) {
    return ChosenFindACoachConversationDynamicByTraineeState(
      chosenFindACoachConversationDynamicList:
          chosenFindACoachConversationDynamicList ??
              this.chosenFindACoachConversationDynamicList,
    );
  }

  @override
  List<Object> get props => [chosenFindACoachConversationDynamicList];
}
