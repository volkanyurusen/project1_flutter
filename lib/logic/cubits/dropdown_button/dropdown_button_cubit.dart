import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dropdown_button_state.dart';

class DropdownButtonCubit extends Cubit<DropdownButtonState> {
  DropdownButtonCubit() : super(DropdownButtonInitialState());

  bool _isDropdownButtonChoiceChanged = false;
  bool get isDropdownButtonChoiceChanged => _isDropdownButtonChoiceChanged;

  void changeChoiceOnDropdownButton() {
    _isDropdownButtonChoiceChanged = !_isDropdownButtonChoiceChanged;

    emit(DropdownButtonChoiceChanged());
  }

  void callInitialStateBack() {
    _isDropdownButtonChoiceChanged = !_isDropdownButtonChoiceChanged;

    emit(DropdownButtonInitialState());
  }
}

//   @override
//   void emit(DropdownButtonState state) {
//     _isDropdownButtonChoiceChanged = false;
//     super.emit(state);
//   }


