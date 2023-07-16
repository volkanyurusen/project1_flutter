import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'text_of_latitude_longitude_on_location_template_adding_pop_up_event.dart';
part 'text_of_latitude_longitude_on_location_template_adding_pop_up_state.dart';

class TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc extends Bloc<
        TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent,
        TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState>
    with LatitudeLongitudeValidationMixin {
  TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc()
      : super(TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState()) {
    on<TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpSubmit>(
        _onTextOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent);
    on<TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpClear>(
        _onTextOfLatitudeLongitudeOnLocationTemplateAddingPopUpClear);
  }

  FutureOr<void> _onTextOfLatitudeLongitudeOnLocationTemplateAddingPopUpEvent(
      TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpSubmit event,
      Emitter<TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState> emit) {
    // print('templateName is: ${event.fieldText}');
    emit(state.copyWith(templateName: event.fieldText));
  }

  FutureOr<void> _onTextOfLatitudeLongitudeOnLocationTemplateAddingPopUpClear(
      TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpClear event,
      Emitter<TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpState> emit) {
    emit(state.copyWith(templateName: ''));
    // print('templateName is: $state.templateName!');
  }
}
