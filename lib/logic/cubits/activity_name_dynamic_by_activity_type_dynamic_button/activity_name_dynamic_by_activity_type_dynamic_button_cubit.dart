import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_button_state.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonCubit
    extends Cubit<ActivityNameDynamicByActivityTypeDynamicButtonState> {
  ActivityNameDynamicByActivityTypeDynamicButtonCubit()
      // ignore: prefer_const_constructors
      : super(ActivityNameDynamicByActivityTypeDynamicButtonState(
            chosenActivityTitleList: const []));

  void pressedActivityNameDynamicByActivityTypeDynamicButton(
      String activityTitle) {
    final state = this.state;

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

  void cleanActivityNameDynamicButton() {
    final statusState = state;

    emit(statusState.copyWith(
        chosenActivityTitleList: List.from(statusState.chosenActivityTitleList)
          ..clear()));
  }
}




// class ActivityNameDynamicByActivityTypeDynamicButtonCubit
//     extends Cubit<ActivityNameDynamicByActivityTypeDynamicButtonState> {
//   ActivityNameDynamicByActivityTypeDynamicButtonCubit()
//       // ignore: prefer_const_constructors
//       : super(ActivityNameDynamicByActivityTypeDynamicButtonState(
//             chosenActivityTitleList: const []));

//   void pressedActivityNameDynamicByActivityTypeDynamicButton(
//       String activityTitle) {
//     final state = this.state;

//     emit(state.copyWith(
//         chosenActivityTitleList: List.from(state.chosenActivityTitleList)
//           ..add(activityTitle)));
//   }

//   void unpressedActivityNameDynamicByActivityTypeDynamicButton(
//       String activityTitle) {
//     final state = this.state;

//     emit(state.copyWith(
//         chosenActivityTitleList: List.from(state.chosenActivityTitleList)
//           ..remove(activityTitle)));
//   }

//   void cleanActivityNameDynamicButton() {
//     final statusState = state;

//     emit(statusState.copyWith(
//         chosenActivityTitleList: List.from(statusState.chosenActivityTitleList)
//           ..clear()));
//   }
// }