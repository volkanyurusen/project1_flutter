part of 'chosen_training_request_among_training_request_dynamic_of_user_cubit.dart';

class ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState
    extends Equatable {
  final List<TrainingRequestDynamic> chosenTrainingRequestDynamicList;

  const ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState({
    required this.chosenTrainingRequestDynamicList,
  });

  ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState copyWith({
    List<TrainingRequestDynamic>? chosenTrainingRequestDynamicList,
  }) {
    return ChosenTrainingRequestAmongTrainingRequestDynamicOfUserState(
      chosenTrainingRequestDynamicList: chosenTrainingRequestDynamicList ??
          this.chosenTrainingRequestDynamicList,
    );
  }

  @override
  List<Object> get props => [chosenTrainingRequestDynamicList];
}
