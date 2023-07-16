import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'clean_all_button_on_activity_template_updating_pop_up_state.dart';

class CleanAllButtonOnActivityTemplateUpdatingPopUpCubit
    extends Cubit<CleanAllButtonOnActivityTemplateUpdatingPopUpState> {
  CleanAllButtonOnActivityTemplateUpdatingPopUpCubit()
      : super(CleanAllButtonOnActivityTemplateUpdatingPopUpInitialState());

  bool _isCleanAllButtonOnActivityTemplateUpdatingPopUpPressed = false;
  bool get isCleanAllButtonOnActivityTemplateUpdatingPopUpPressed =>
      _isCleanAllButtonOnActivityTemplateUpdatingPopUpPressed;

  void pressCleanAllButtonOnActivityTemplateUpdatingPopUp() {
    _isCleanAllButtonOnActivityTemplateUpdatingPopUpPressed =
        !_isCleanAllButtonOnActivityTemplateUpdatingPopUpPressed;

    emit(CleanAllButtonOnActivityTemplateUpdatingPopUpClicked());
  }

  void callInitialStateBack() {
    _isCleanAllButtonOnActivityTemplateUpdatingPopUpPressed =
        !_isCleanAllButtonOnActivityTemplateUpdatingPopUpPressed;

    emit(CleanAllButtonOnActivityTemplateUpdatingPopUpInitialState());
  }
}

//   @override
//   void emit(CleanAllButtonOnActivityTemplateUpdatingPopUpState state) {
//     _isCleanAllButtonOnActivityTemplateUpdatingPopUpPressed = false;
//     super.emit(state);
//   }


