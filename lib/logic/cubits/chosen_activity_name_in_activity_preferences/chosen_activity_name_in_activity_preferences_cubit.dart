import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'chosen_activity_name_in_activity_preferences_state.dart';

class ChosenActivityNameInActivityPreferencesCubit
    extends Cubit<ChosenActivityNameInActivityPreferencesState> {
  ChosenActivityNameInActivityPreferencesCubit()
      : super(ChosenActivityNameInActivityPreferencesState(
            chosenActivityTitleInActivityPreferences: const []));

  void pressedChosenActivityNameInActivityPreferences(String activityTitle) {
    if (state.chosenActivityTitleInActivityPreferences
        .contains(activityTitle)) {
      emit(state.copyWith(
          chosenActivityTitleInActivityPreferences:
              List.from(state.chosenActivityTitleInActivityPreferences)
                ..remove(activityTitle)));
    } else {
      emit(state.copyWith(
          chosenActivityTitleInActivityPreferences:
              List.from(state.chosenActivityTitleInActivityPreferences)
                ..add(activityTitle)));
    }
  }

  void cleanUserPreferredActivityTitle() {
    emit(state.copyWith(
        chosenActivityTitleInActivityPreferences:
            List.from(state.chosenActivityTitleInActivityPreferences)
              ..clear()));
  }
}
