part of 'chosen_training_request_message_dynamic_by_user_cubit.dart';

class ChosenTrainingRequestMessageDynamicByUserState
    extends Equatable {
  final List<TrainingRequestMessageDynamic>
      chosenTrainingRequestMessageDynamicList;

  const ChosenTrainingRequestMessageDynamicByUserState({
    required this.chosenTrainingRequestMessageDynamicList,
  });

  ChosenTrainingRequestMessageDynamicByUserState copyWith({
    List<TrainingRequestMessageDynamic>?
        chosenTrainingRequestMessageDynamicList,
  }) =>
      ChosenTrainingRequestMessageDynamicByUserState(
        chosenTrainingRequestMessageDynamicList:
            chosenTrainingRequestMessageDynamicList ??
                this.chosenTrainingRequestMessageDynamicList,
      );

  @override
  List<Object> get props => [chosenTrainingRequestMessageDynamicList];
}
