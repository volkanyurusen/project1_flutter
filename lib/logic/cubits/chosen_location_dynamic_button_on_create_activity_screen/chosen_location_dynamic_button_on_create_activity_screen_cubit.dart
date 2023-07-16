import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_location_dynamic_button_on_create_activity_screen_state.dart';

class ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit
    extends Cubit<
        ChosenLocationDetailDynamicButtonOnCreateActivityScreenState> {
  ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit()
      : super(ChosenLocationDetailDynamicButtonOnCreateActivityScreenState(
            chosenLocationDetailDynamicList: []));

  void pressedChosenLocationDetailDynamicButtonOnCreateActivityScreen(
      LocationDetailDynamic locationDetailDynamic) {
    final statusState = state;

    if (statusState.chosenLocationDetailDynamicList.isNotEmpty) {
      statusState.chosenLocationDetailDynamicList.clear();
      emit(statusState.copyWith(
          chosenLocationDetailDynamicList:
              List.from(statusState.chosenLocationDetailDynamicList)
                ..add(locationDetailDynamic)));
    } else {
      emit(statusState.copyWith(
          chosenLocationDetailDynamicList:
              List.from(statusState.chosenLocationDetailDynamicList)
                ..add(locationDetailDynamic)));
    }
  }

  void unchooseChosenLocationDetailDynamicButtonOnCreateActivityScreen() {
    if (state.chosenLocationDetailDynamicList.isNotEmpty) {
      state.copyWith(
          chosenLocationDetailDynamicList:
              List.from(state.chosenLocationDetailDynamicList..clear()));
    }
  }
}
