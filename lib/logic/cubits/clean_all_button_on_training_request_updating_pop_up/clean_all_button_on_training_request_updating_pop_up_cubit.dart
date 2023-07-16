import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'clean_all_button_on_training_request_updating_pop_up_state.dart';

class CleanAllButtonOnTrainingRequestUpdatingPopUpCubit
    extends Cubit<CleanAllButtonOnTrainingRequestUpdatingPopUpState> {
  CleanAllButtonOnTrainingRequestUpdatingPopUpCubit()
      : super(CleanAllButtonOnTrainingRequestUpdatingPopUpInitialState());

  bool _isCleanAllButtonOnTrainingRequestUpdatingPopUpPressed = false;
  bool get isCleanAllButtonOnTrainingRequestUpdatingPopUpPressed =>
      _isCleanAllButtonOnTrainingRequestUpdatingPopUpPressed;

  void pressCleanAllButtonOnTrainingRequestUpdatingPopUp() {
    _isCleanAllButtonOnTrainingRequestUpdatingPopUpPressed =
        !_isCleanAllButtonOnTrainingRequestUpdatingPopUpPressed;

    emit(CleanAllButtonOnTrainingRequestUpdatingPopUpClicked());
  }

  void callInitialStateBack() {
    _isCleanAllButtonOnTrainingRequestUpdatingPopUpPressed =
        !_isCleanAllButtonOnTrainingRequestUpdatingPopUpPressed;

    emit(CleanAllButtonOnTrainingRequestUpdatingPopUpInitialState());
  }
}

//   @override
//   void emit(CleanAllButtonOnTrainingRequestUpdatingPopUpState state) {
//     _isCleanAllButtonOnTrainingRequestUpdatingPopUpPressed = false;
//     super.emit(state);
//   }


