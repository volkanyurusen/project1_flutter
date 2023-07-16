import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_find_a_coach_message_dynamic_by_trainee_state.dart';

class ChosenFindACoachMessageDynamicByTraineeCubit
    extends Cubit<ChosenFindACoachMessageDynamicByTraineeState> {
  ChosenFindACoachMessageDynamicByTraineeCubit()
      : super(ChosenFindACoachMessageDynamicByTraineeState(
            chosenFindACoachMessageDynamicList: []));

  void pressMessage(TrainingOfferMessageDynamic trainingOfferMessageDynamic) {
    final state = this.state;

    if (state.chosenFindACoachMessageDynamicList.isNotEmpty) {
      state.chosenFindACoachMessageDynamicList.clear();
    }

    emit(state.copyWith(
        chosenFindACoachMessageDynamicList: List.from(
            state.chosenFindACoachMessageDynamicList
              ..add(trainingOfferMessageDynamic))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenFindACoachMessageDynamicList:
  //           List.from(state.chosenFindACoachMessageDynamicList..clear())));
  // }
}
