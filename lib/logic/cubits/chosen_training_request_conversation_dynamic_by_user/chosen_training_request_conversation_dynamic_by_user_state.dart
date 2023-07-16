part of 'chosen_training_request_conversation_dynamic_by_user_cubit.dart';

class ChosenTrainingRequestConversationDynamicByUserState
    extends Equatable {
  final List<TrainingRequestConversationDynamic>
      chosenTrainingRequestConversationDynamicList;

  const ChosenTrainingRequestConversationDynamicByUserState({
    required this.chosenTrainingRequestConversationDynamicList,
  });

  ChosenTrainingRequestConversationDynamicByUserState copyWith({
    List<TrainingRequestConversationDynamic>?
        chosenTrainingRequestConversationDynamicList,
  }) {
    return ChosenTrainingRequestConversationDynamicByUserState(
      chosenTrainingRequestConversationDynamicList:
          chosenTrainingRequestConversationDynamicList ??
              this.chosenTrainingRequestConversationDynamicList,
    );
  }

  @override
  List<Object> get props => [chosenTrainingRequestConversationDynamicList];
}
