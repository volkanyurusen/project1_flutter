import 'package:my_project/logic/blocs/blocs.dart';
import 'package:equatable/equatable.dart';

part 'clean_all_button_on_create_activity_screen_state.dart';

class CleanAllButtonOnCreateActivityScreenCubit
    extends Cubit<CleanAllButtonOnCreateActivityScreenState> {
  CleanAllButtonOnCreateActivityScreenCubit()
      : super(CleanAllButtonOnCreateActivityScreenInitialState());

  bool _isCleanAllButtonOnCreateActivityScreenPressed = false;
  bool get isCleanAllButtonOnCreateActivityScreenPressed =>
      _isCleanAllButtonOnCreateActivityScreenPressed;

  void pressCleanAllButtonOnCreateActivityScreen() {
    _isCleanAllButtonOnCreateActivityScreenPressed =
        !_isCleanAllButtonOnCreateActivityScreenPressed;

    emit(CleanAllButtonOnCreateActivityScreenClicked());
  }

  void callInitialStateBack() {
    _isCleanAllButtonOnCreateActivityScreenPressed =
        !_isCleanAllButtonOnCreateActivityScreenPressed;

    emit(CleanAllButtonOnCreateActivityScreenInitialState());
  }
}

//   @override
//   void emit(CleanAllButtonOnCreateActivityScreenState state) {
//     _isCleanAllButtonOnCreateActivityScreenPressed = false;
//     super.emit(state);
//   }


