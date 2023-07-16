import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'clean_all_button_state.dart';

class CleanAllButtonCubit extends Cubit<CleanAllButtonState> {
  CleanAllButtonCubit() : super(CleanAllButtonInitialState());

  bool _isCleanAllButtonPressed = false;
  bool get isCleanAllButtonPressed => _isCleanAllButtonPressed;

  void pressCleanAllButton() {
    _isCleanAllButtonPressed = !_isCleanAllButtonPressed;

    emit(CleanAllButtonClicked());
  }

  void callInitialStateBack() {
    _isCleanAllButtonPressed = !_isCleanAllButtonPressed;

    emit(CleanAllButtonInitialState());
  }
}

//   @override
//   void emit(CleanAllButtonState state) {
//     _isCleanAllButtonPressed = false;
//     super.emit(state);
//   }


