import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_host_who_created_activity_state.dart';

class ChosenHostWhoCreatedActivityCubit
    extends Cubit<ChosenHostWhoCreatedActivityState> {
  ChosenHostWhoCreatedActivityCubit()
      : super(ChosenHostWhoCreatedActivityState(
            chosenConsistedActivityDynamicWithDistance: []));

  void pressChosenHost(
      ConsistedActivityDynamicWithDistance
          consistedActivityDynamicWithDistance) {
    final state = this.state;

    if (state.chosenConsistedActivityDynamicWithDistance.isNotEmpty) {
      state.chosenConsistedActivityDynamicWithDistance.clear();
    }
    emit(state.copyWith(
        chosenConsistedActivityDynamicWithDistance: List.from(
            state.chosenConsistedActivityDynamicWithDistance
              ..add(consistedActivityDynamicWithDistance))));
  }

  // void pressBackButton(
  //     ConsistedActivityDynamicWithDistance
  //         consistedActivityDynamicWithDistance) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenConsistedActivityDynamicWithDistance: List.from(
  //           state.chosenConsistedActivityDynamicWithDistance
  //             ..remove(consistedActivityDynamicWithDistance))));
  // }
}
