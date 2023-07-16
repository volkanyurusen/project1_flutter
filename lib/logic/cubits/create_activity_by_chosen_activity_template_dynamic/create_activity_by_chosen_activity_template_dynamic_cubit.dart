import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

import '../../../models/models_dynamics.dart';

part 'create_activity_by_chosen_activity_template_dynamic_state.dart';

class CreateActivityByChosenActivityTemplateDynamicCubit
    extends Cubit<CreateActivityByChosenActivityTemplateDynamicState> {
  CreateActivityByChosenActivityTemplateDynamicCubit()
      // ignore: prefer_const_constructors
      : super(CreateActivityByChosenActivityTemplateDynamicState(
            chosenActivityTemplateDynamicList: const []));

  void pressedCreateActivityByChosenActivityTemplateDynamic(
      ActivityTemplateDynamic activityTemplateDynamic) {
    final statusState = state;

    if (statusState.chosenActivityTemplateDynamicList.isNotEmpty) {
      statusState.chosenActivityTemplateDynamicList.clear();
    }
    emit(statusState.copyWith(
        chosenActivityTemplateDynamicList:
            List.from(statusState.chosenActivityTemplateDynamicList)
              ..add(activityTemplateDynamic)));
  }

  void unchooseChosenActivityTemplateDynamic() {
    emit(state.copyWith(
        chosenActivityTemplateDynamicList:
            List.from(state.chosenActivityTemplateDynamicList)..clear()));
  }
}
