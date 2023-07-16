import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_activity_template_name_on_activity_template_adding_pop_up_event.dart';
part 'text_of_activity_template_name_on_activity_template_adding_pop_up_state.dart';

class TextOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc extends Bloc<
        TextOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent,
        TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState>
    with TemplateNameValidationMixin {
  TextOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc()
      : super(TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState()) {
    on<TextOfActivityTemplateNameOnActivityTemplateAddingPopUpSubmit>(
        _onTextOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent);
    on<TextOfActivityTemplateNameOnActivityTemplateAddingPopUpClear>(
        _onTextOfActivityTemplateNameOnActivityTemplateAddingPopUpClear);
  }

  FutureOr<void>
      _onTextOfActivityTemplateNameOnActivityTemplateAddingPopUpEvent(
          TextOfActivityTemplateNameOnActivityTemplateAddingPopUpSubmit event,
          Emitter<TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState>
              emit) {
    // print('templateName is: ${event.fieldText}');
    emit(state.copyWith(templateName: event.fieldText));
  }

  FutureOr<void>
      _onTextOfActivityTemplateNameOnActivityTemplateAddingPopUpClear(
          TextOfActivityTemplateNameOnActivityTemplateAddingPopUpClear event,
          Emitter<TextOfActivityTemplateNameOnActivityTemplateAddingPopUpState>
              emit) {
    emit(state.copyWith(templateName: ''));
    // print('templateName is: $state.templateName!');
  }
}
