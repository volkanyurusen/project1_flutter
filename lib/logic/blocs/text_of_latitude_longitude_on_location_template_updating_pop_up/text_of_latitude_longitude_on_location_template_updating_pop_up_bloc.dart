import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_latitude_longitude_on_location_template_updating_pop_up_event.dart';
part 'text_of_latitude_longitude_on_location_template_updating_pop_up_state.dart';

class TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc extends Bloc<
        TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent,
        TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>
    with LatitudeLongitudeValidationMixin {
  TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc()
      : super(TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState()) {
    on<TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit>(
        _onTextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent);
    on<TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpClear>(
        _onTextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpClear);
  }

  FutureOr<void>
      _onTextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpEvent(
          TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpSubmit event,
          Emitter<TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>
              emit) {
    // print('templateName is: ${event.fieldText}');
    emit(state.copyWith(templateName: event.fieldText));
  }

  FutureOr<void>
      _onTextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpClear(
          TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpClear event,
          Emitter<TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpState>
              emit) {
    emit(state.copyWith(templateName: ''));
    // print('templateName is: $state.templateName!');
  }
}
