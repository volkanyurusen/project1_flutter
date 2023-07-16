import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'clean_all_button_on_find_a_trainee_screen_state.dart';

class CleanAllButtonOnFindATraineeScreenCubit
    extends Cubit<CleanAllButtonOnFindATraineeScreenState> {
  CleanAllButtonOnFindATraineeScreenCubit()
      : super(CleanAllButtonOnFindATraineeScreenInitialState());

  bool _isCleanAllButtonOnFindATraineeScreenPressed = false;
  bool get isCleanAllButtonOnFindATraineeScreenPressed =>
      _isCleanAllButtonOnFindATraineeScreenPressed;

  void pressCleanAllButtonOnFindATraineeScreen() {
    _isCleanAllButtonOnFindATraineeScreenPressed =
        !_isCleanAllButtonOnFindATraineeScreenPressed;

    emit(CleanAllButtonOnFindATraineeScreenClicked());
  }

  void callInitialStateBack() {
    _isCleanAllButtonOnFindATraineeScreenPressed =
        !_isCleanAllButtonOnFindATraineeScreenPressed;

    emit(CleanAllButtonOnFindATraineeScreenInitialState());
  }
}

//   @override
//   void emit(CleanAllButtonOnFindATraineeScreenState state) {
//     _isCleanAllButtonOnFindATraineeScreenPressed = false;
//     super.emit(state);
//   }


