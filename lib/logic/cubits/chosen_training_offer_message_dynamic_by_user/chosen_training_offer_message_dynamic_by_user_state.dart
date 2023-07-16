part of 'chosen_training_offer_message_dynamic_by_user_cubit.dart';

class ChosenTrainingOfferMessageDynamicByUserState extends Equatable {
  final List<TrainingOfferMessageDynamic> chosenTrainingOfferMessageDynamicList;

  const ChosenTrainingOfferMessageDynamicByUserState({
    required this.chosenTrainingOfferMessageDynamicList,
  });

  ChosenTrainingOfferMessageDynamicByUserState copyWith({
    List<TrainingOfferMessageDynamic>? chosenTrainingOfferMessageDynamicList,
  }) =>
      ChosenTrainingOfferMessageDynamicByUserState(
        chosenTrainingOfferMessageDynamicList:
            chosenTrainingOfferMessageDynamicList ??
                this.chosenTrainingOfferMessageDynamicList,
      );

  @override
  List<Object> get props => [chosenTrainingOfferMessageDynamicList];
}
