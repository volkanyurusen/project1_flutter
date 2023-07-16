import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';

part 'chosen_activity_template_among_activity_template_dynamic_of_user_on_adding_pop_up_state.dart';

class ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpCubit
    extends Cubit<
        ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpState> {
  ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpCubit()
      : super(
            ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpState(
                chosenActivityTemplateList: []));

  void pressActivityTemplate(ActivityTemplateDynamic chosenActivityTemplate) {
    final state = this.state;

    if (state.chosenActivityTemplateList.isNotEmpty) {
      state.chosenActivityTemplateList.clear();
    }
    emit(state.copyWith(
        chosenActivityTemplateList: List.from(
            state.chosenActivityTemplateList..add(chosenActivityTemplate))));
  }

  // void pressCancelButton(ActivityTemplateDynamic chosenActivityTemplate) {
  //   final state = this.state;

  //   emit(state.copyWith(
  //       chosenActivityTemplateList: List.from(
  //           state.chosenActivityTemplateList..remove(chosenActivityTemplate))));
  // }
}
