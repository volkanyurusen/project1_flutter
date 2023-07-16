import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_reading/xmodels_reading.dart';

part 'chosen_result_of_preferred_activity_dynamic_state.dart';

class ChosenResultOfPreferredActivityDynamicCubit
    extends Cubit<ChosenResultOfPreferredActivityDynamicState> {
  ChosenResultOfPreferredActivityDynamicCubit()
      : super(ChosenResultOfPreferredActivityDynamicState(
            chosenCreatedActivityDynamicWithDistanceList: []));

  void pressUserCard(
      ActivityTile activityTile) {
    final state = this.state;

    if (state.chosenCreatedActivityDynamicWithDistanceList.isNotEmpty) {
      state.chosenCreatedActivityDynamicWithDistanceList.clear();
    }

    emit(state.copyWith(
        chosenCreatedActivityDynamicWithDistanceList: List.from(
            state.chosenCreatedActivityDynamicWithDistanceList
              ..add(activityTile))));
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
