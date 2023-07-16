import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'clean_all_button_on_training_request_adding_pop_up_state.dart';

class CleanAllButtonOnTrainingRequestAddingPopUpCubit
    extends Cubit<CleanAllButtonOnTrainingRequestAddingPopUpState> {
  CleanAllButtonOnTrainingRequestAddingPopUpCubit()
      : super(CleanAllButtonOnTrainingRequestAddingPopUpInitialState());

  bool _isCleanAllButtonOnTrainingRequestAddingPopUpPressed = false;
  bool get isCleanAllButtonOnTrainingRequestAddingPopUpPressed =>
      _isCleanAllButtonOnTrainingRequestAddingPopUpPressed;

  void pressCleanAllButtonOnTrainingRequestAddingPopUp() {
    _isCleanAllButtonOnTrainingRequestAddingPopUpPressed =
        !_isCleanAllButtonOnTrainingRequestAddingPopUpPressed;

    emit(CleanAllButtonOnTrainingRequestAddingPopUpClicked());
  }

  void callInitialStateBack() {
    _isCleanAllButtonOnTrainingRequestAddingPopUpPressed =
        !_isCleanAllButtonOnTrainingRequestAddingPopUpPressed;

    emit(CleanAllButtonOnTrainingRequestAddingPopUpInitialState());
  }
}

//   @override
//   void emit(CleanAllButtonOnTrainingRequestAddingPopUpState state) {
//     _isCleanAllButtonOnTrainingRequestAddingPopUpPressed = false;
//     super.emit(state);
//   }


