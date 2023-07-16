import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_activity_among_created_activity_dynamic_created_by_user_state.dart';

class ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit
    extends Cubit<ChosenActivityAmongCreatedActivityDynamicCreatedByUserState> {
  ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit()
      : super(ChosenActivityAmongCreatedActivityDynamicCreatedByUserState(
            chosenCreatedActivityDynamicWithDistanceList: []));

  void pressCreatedActivity(
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
