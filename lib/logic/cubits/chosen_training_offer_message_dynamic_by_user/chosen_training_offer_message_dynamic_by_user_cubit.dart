import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_training_offer_message_dynamic_by_user_state.dart';

class ChosenTrainingOfferMessageDynamicByUserCubit
    extends Cubit<ChosenTrainingOfferMessageDynamicByUserState> {
  ChosenTrainingOfferMessageDynamicByUserCubit()
      : super(ChosenTrainingOfferMessageDynamicByUserState(
            chosenTrainingOfferMessageDynamicList: []));

  void pressMessage(TrainingOfferMessageDynamic trainingOfferMessageDynamic) {
    final state = this.state;

    if (state.chosenTrainingOfferMessageDynamicList.isNotEmpty) {
      state.chosenTrainingOfferMessageDynamicList.clear();
    }

    emit(state.copyWith(
        chosenTrainingOfferMessageDynamicList: List.from(
            state.chosenTrainingOfferMessageDynamicList
              ..add(trainingOfferMessageDynamic))));
  }

  // void pressCancelButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenTrainingOfferMessageDynamicList:
  //           List.from(state.chosenTrainingOfferMessageDynamicList..clear())));
  // }
}
