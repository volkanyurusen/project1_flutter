import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_name_button_state.dart';

class ActivityNameButtonCubit extends Cubit<ActivityNameButtonState> {
  ActivityNameButtonCubit()
      : super(ActivityNameButtonState(chosenActivityTitleList: const []));

  void pressedActivityNameButton(String activityTitle) {
    if (state.chosenActivityTitleList.contains(activityTitle)) {
      emit(state.copyWith(
          chosenActivityTitleList: List.from(state.chosenActivityTitleList)
            ..remove(activityTitle)));
    } else {
      emit(state.copyWith(
          chosenActivityTitleList: List.from(state.chosenActivityTitleList)
            ..add(activityTitle)));
    }
  }

  void addUserPreferredActivityTitle(Iterable<String> activityTitleList) {
    emit(state.copyWith(
        chosenActivityTitleList: List.from(state.chosenActivityTitleList)
          ..addAll(activityTitleList)));
  }

  void cleanUserPreferredActivityTitle() {
    emit(state.copyWith(
        chosenActivityTitleList: List.from(state.chosenActivityTitleList)
          ..clear()));
  }
}
