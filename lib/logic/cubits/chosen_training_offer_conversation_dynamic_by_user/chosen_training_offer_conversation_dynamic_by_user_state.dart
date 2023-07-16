part of 'chosen_training_offer_conversation_dynamic_by_user_cubit.dart';

class ChosenTrainingOfferConversationDynamicByUserState extends Equatable {
  final List<TrainingOfferConversationDynamic>
      chosenTrainingOfferConversationDynamicList;

  const ChosenTrainingOfferConversationDynamicByUserState({
    required this.chosenTrainingOfferConversationDynamicList,
  });

  ChosenTrainingOfferConversationDynamicByUserState copyWith({
    List<TrainingOfferConversationDynamic>?
        chosenTrainingOfferConversationDynamicList,
  }) {
    return ChosenTrainingOfferConversationDynamicByUserState(
      chosenTrainingOfferConversationDynamicList:
          chosenTrainingOfferConversationDynamicList ??
              this.chosenTrainingOfferConversationDynamicList,
    );
  }

  @override
  List<Object> get props => [chosenTrainingOfferConversationDynamicList];
}
