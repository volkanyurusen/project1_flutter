part of 'chosen_activity_conversation_dynamic_by_user_cubit.dart';

class ChosenActivityConversationDynamicByUserState extends Equatable {
  final List<ActivityConversationDynamic> chosenActivityConversationDynamicList;

  const ChosenActivityConversationDynamicByUserState({
    required this.chosenActivityConversationDynamicList,
  });

  ChosenActivityConversationDynamicByUserState copyWith({
    List<ActivityConversationDynamic>? chosenActivityConversationDynamicList,
  }) {
    return ChosenActivityConversationDynamicByUserState(
      chosenActivityConversationDynamicList:
          chosenActivityConversationDynamicList ??
              this.chosenActivityConversationDynamicList,
    );
  }

  @override
  List<Object> get props => [chosenActivityConversationDynamicList];
}
