import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'clean_all_button_on_training_offer_adding_pop_up_state.dart';

class CleanAllButtonOnTrainingOfferAddingPopUpCubit
    extends Cubit<CleanAllButtonOnTrainingOfferAddingPopUpState> {
  CleanAllButtonOnTrainingOfferAddingPopUpCubit()
      : super(CleanAllButtonOnTrainingOfferAddingPopUpInitialState());

  bool _isCleanAllButtonOnTrainingOfferAddingPopUpPressed = false;
  bool get isCleanAllButtonOnTrainingOfferAddingPopUpPressed =>
      _isCleanAllButtonOnTrainingOfferAddingPopUpPressed;

  void pressCleanAllButtonOnTrainingOfferAddingPopUp() {
    _isCleanAllButtonOnTrainingOfferAddingPopUpPressed =
        !_isCleanAllButtonOnTrainingOfferAddingPopUpPressed;

    emit(CleanAllButtonOnTrainingOfferAddingPopUpClicked());
  }

  void callInitialStateBack() {
    _isCleanAllButtonOnTrainingOfferAddingPopUpPressed =
        !_isCleanAllButtonOnTrainingOfferAddingPopUpPressed;

    emit(CleanAllButtonOnTrainingOfferAddingPopUpInitialState());
  }
}

//   @override
//   void emit(CleanAllButtonOnTrainingOfferAddingPopUpState state) {
//     _isCleanAllButtonOnTrainingOfferAddingPopUpPressed = false;
//     super.emit(state);
//   }


