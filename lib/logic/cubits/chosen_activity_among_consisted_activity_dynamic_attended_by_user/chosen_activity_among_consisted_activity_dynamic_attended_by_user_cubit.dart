import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_activity_among_consisted_activity_dynamic_attended_by_user_state.dart';

class ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit
    extends Cubit<
        ChosenActivityAmongConsistedActivityDynamicAttendedByUserState> {
  ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit()
      : super(ChosenActivityAmongConsistedActivityDynamicAttendedByUserState(
            chosenConsistedActivityDynamicWithDistanceList: []));

  void pressUserCard(
      ConsistedActivityDynamicWithDistance
          consistedActivityDynamicWithDistance) {
    final state = this.state;

    if (state.chosenConsistedActivityDynamicWithDistanceList.isNotEmpty) {
      state.chosenConsistedActivityDynamicWithDistanceList.clear();
    }
    emit(state.copyWith(
        chosenConsistedActivityDynamicWithDistanceList: List.from(
            state.chosenConsistedActivityDynamicWithDistanceList
              ..add(consistedActivityDynamicWithDistance))));
  }

  // void pressBackButton(
  //     ConsistedActivityDynamicWithDistance
  //         consistedActivityDynamicWithDistance) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenConsistedActivityDynamicWithDistanceList: List.from(
  //           state.chosenConsistedActivityDynamicWithDistanceList
  //             ..remove(consistedActivityDynamicWithDistance))));
  // }
}
