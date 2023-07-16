part of 'chosen_activity_message_dynamic_by_user_cubit.dart';

class ChosenActivityMessageDynamicByUserState extends Equatable {
  final List<MessageDynamic> chosenActivityMessageDynamicList;

  const ChosenActivityMessageDynamicByUserState({
    required this.chosenActivityMessageDynamicList,
  });

  ChosenActivityMessageDynamicByUserState copyWith({
    List<MessageDynamic>? chosenActivityMessageDynamicList,
  }) =>
      ChosenActivityMessageDynamicByUserState(
        chosenActivityMessageDynamicList: chosenActivityMessageDynamicList ??
            this.chosenActivityMessageDynamicList,
      );

  @override
  List<Object> get props => [chosenActivityMessageDynamicList];
}
