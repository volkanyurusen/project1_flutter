part of 'activity_conversation_dynamic_by_chosen_attributes_bloc.dart';

abstract class ActivityConversationDynamicByChosenAttributesEvent
    extends Equatable {
  const ActivityConversationDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadActivityConversationDynamicByChosenAttributesEvent
    extends ActivityConversationDynamicByChosenAttributesEvent {
  final int consistedActivityId;

  const LoadActivityConversationDynamicByChosenAttributesEvent({
    required this.consistedActivityId,
  });

  @override
  List<Object> get props => [consistedActivityId];
}
