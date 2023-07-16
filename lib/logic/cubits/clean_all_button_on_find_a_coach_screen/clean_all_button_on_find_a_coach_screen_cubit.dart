import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'clean_all_button_on_find_a_coach_screen_state.dart';

class CleanAllButtonOnFindACoachScreenCubit
    extends Cubit<CleanAllButtonOnFindACoachScreenState> {
  CleanAllButtonOnFindACoachScreenCubit()
      : super(CleanAllButtonOnFindACoachScreenInitialState());

  bool _isCleanAllButtonOnFindACoachScreenPressed = false;
  bool get isCleanAllButtonOnFindACoachScreenPressed =>
      _isCleanAllButtonOnFindACoachScreenPressed;

  void pressCleanAllButtonOnFindACoachScreen() {
    _isCleanAllButtonOnFindACoachScreenPressed =
        !_isCleanAllButtonOnFindACoachScreenPressed;

    emit(CleanAllButtonOnFindACoachScreenClicked());
  }

  void callInitialStateBack() {
    _isCleanAllButtonOnFindACoachScreenPressed =
        !_isCleanAllButtonOnFindACoachScreenPressed;

    emit(CleanAllButtonOnFindACoachScreenInitialState());
  }
}

//   @override
//   void emit(CleanAllButtonOnFindACoachScreenState state) {
//     _isCleanAllButtonOnFindACoachScreenPressed = false;
//     super.emit(state);
//   }


