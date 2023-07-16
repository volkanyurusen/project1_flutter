import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_location_template_among_location_template_dynamic_of_user_on_updating_pop_up_state.dart';

class ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit
    extends Cubit<
        ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpState> {
  ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit()
      : super(
            ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpState(
                chosenLocationTemplateDynamicList: []));

  void pressLocationTemplate(LocationTemplateDynamic locationTemplateDynamic) {
    final state = this.state;

    if (state.chosenLocationTemplateDynamicList.isNotEmpty) {
      state.chosenLocationTemplateDynamicList.clear();
    }

    emit(state.copyWith(
        chosenLocationTemplateDynamicList: List.from(
            state.chosenLocationTemplateDynamicList
              ..add(locationTemplateDynamic))));
  }

  // void pressCancelButton(LocationTemplateDynamic locationTemplateDynamic) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenLocationTemplateDynamicList: List.from(
  //           state.chosenLocationTemplateDynamicList
  //             ..remove(locationTemplateDynamic))));
  // }
}
