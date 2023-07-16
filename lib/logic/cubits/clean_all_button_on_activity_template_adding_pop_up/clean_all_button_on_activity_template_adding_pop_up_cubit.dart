import 'package:my_project/logic/blocs/blocs.dart';
import 'package:equatable/equatable.dart';

part 'clean_all_button_on_activity_template_adding_pop_up_state.dart';

class CleanAllButtonOnActivityTemplateAddingPopUpCubit
    extends Cubit<CleanAllButtonOnActivityTemplateAddingPopUpState> {
  CleanAllButtonOnActivityTemplateAddingPopUpCubit()
      : super(CleanAllButtonOnActivityTemplateAddingPopUpInitialState());

  bool _isCleanAllButtonOnActivityTemplateAddingPopUpPressed = false;
  bool get isCleanAllButtonOnActivityTemplateAddingPopUpPressed =>
      _isCleanAllButtonOnActivityTemplateAddingPopUpPressed;

  void pressCleanAllButtonOnActivityTemplateAddingPopUp() {
    _isCleanAllButtonOnActivityTemplateAddingPopUpPressed =
        !_isCleanAllButtonOnActivityTemplateAddingPopUpPressed;

    emit(CleanAllButtonOnActivityTemplateAddingPopUpClicked());
  }

  void callInitialStateBack() {
    _isCleanAllButtonOnActivityTemplateAddingPopUpPressed =
        !_isCleanAllButtonOnActivityTemplateAddingPopUpPressed;

    emit(CleanAllButtonOnActivityTemplateAddingPopUpInitialState());
  }
}

//   @override
//   void emit(CleanAllButtonOnActivityTemplateAddingPopUpState state) {
//     _isCleanAllButtonOnActivityTemplateAddingPopUpPressed = false;
//     super.emit(state);
//   }


