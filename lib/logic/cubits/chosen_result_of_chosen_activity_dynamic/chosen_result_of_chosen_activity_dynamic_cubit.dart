import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/created_activity_dynamic_with_distance.dart';

part 'chosen_result_of_chosen_activity_dynamic_state.dart';

class ChosenResultOfChosenActivityDynamicCubit
    extends Cubit<ChosenResultOfChosenActivityDynamicState> {
  ChosenResultOfChosenActivityDynamicCubit()
      : super(ChosenResultOfChosenActivityDynamicState(
            chosenCreatedActivityDynamicWithDistanceList: []));

  void pressUserCard(
      CreatedActivityDynamicWithDistance createdActivityDynamicWithDistance) {
    final state = this.state;

    if (state.chosenCreatedActivityDynamicWithDistanceList.isNotEmpty) {
      state.chosenCreatedActivityDynamicWithDistanceList.clear();
    }

    emit(state.copyWith(
        chosenCreatedActivityDynamicWithDistanceList: List.from(
            state.chosenCreatedActivityDynamicWithDistanceList
              ..add(createdActivityDynamicWithDistance))));
  }

  // void pressBackButton(
  //     CreatedActivityDynamicWithDistance createdActivityDynamicWithDistance) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenCreatedActivityDynamicWithDistanceList: List.from(
  //           state.chosenCreatedActivityDynamicWithDistanceList
  //             ..remove(createdActivityDynamicWithDistance))));
  // }
}
