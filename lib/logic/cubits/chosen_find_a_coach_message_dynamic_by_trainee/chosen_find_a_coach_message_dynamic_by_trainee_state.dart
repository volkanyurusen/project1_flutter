part of 'chosen_find_a_coach_message_dynamic_by_trainee_cubit.dart';

class ChosenFindACoachMessageDynamicByTraineeState extends Equatable {
  final List<TrainingOfferMessageDynamic> chosenFindACoachMessageDynamicList;

  const ChosenFindACoachMessageDynamicByTraineeState({
    required this.chosenFindACoachMessageDynamicList,
  });

  ChosenFindACoachMessageDynamicByTraineeState copyWith({
    List<TrainingOfferMessageDynamic>? chosenFindACoachMessageDynamicList,
  }) =>
      ChosenFindACoachMessageDynamicByTraineeState(
        chosenFindACoachMessageDynamicList:
            chosenFindACoachMessageDynamicList ??
                this.chosenFindACoachMessageDynamicList,
      );

  @override
  List<Object> get props => [chosenFindACoachMessageDynamicList];
}
