import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';

part 'chosen_coaching_type_state.dart';

class ChosenCoachingTypeCubit extends Cubit<ChosenCoachingTypeState> {
  ChosenCoachingTypeCubit()
      : super(ChosenCoachingTypeState(chosenCoachingTypeList: []));

  void pressChosenCoachingType(CoachingType chosenCoachingType) {
    final state = this.state;

    if (state.chosenCoachingTypeList.isNotEmpty) {
      state.chosenCoachingTypeList.clear();
    }

    emit(state.copyWith(
        chosenCoachingTypeList:
            List.from(state.chosenCoachingTypeList..add(chosenCoachingType))));
  }

  // void pressBackButton() {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenCoachingTypeList:
  //           List.from(state.chosenCoachingTypeList..clear())));
  // }
}
