import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_activity_template_name_on_activity_template_updating_pop_up_event.dart';
part 'text_of_activity_template_name_on_activity_template_updating_pop_up_state.dart';

class TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc
    extends Bloc<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent,
        TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>
    with TemplateNameValidationMixin {
  TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc()
      : super(
            TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState()) {
    on<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit>(
        _onTextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent);
    on<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear>(
        _onTextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear);
  }

  FutureOr<void>
      _onTextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpEvent(
          TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpSubmit event,
          Emitter<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>
              emit) {
    //
    // print('templateName is: ${event.fieldText}');
    emit(state.copyWith(templateName: event.fieldText));
  }

  FutureOr<void>
      _onTextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear(
          TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpClear event,
          Emitter<TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpState>
              emit) {
    emit(state.copyWith(templateName: ''));
    //
    //print('name is: $state');
  }
}
