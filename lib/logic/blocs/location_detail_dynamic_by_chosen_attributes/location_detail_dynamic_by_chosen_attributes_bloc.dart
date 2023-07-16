import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'location_detail_dynamic_by_chosen_attributes_event.dart';
part 'location_detail_dynamic_by_chosen_attributes_state.dart';

class LocationDetailDynamicByChosenAttributesBloc extends Bloc<
    LocationDetailDynamicByChosenAttributesEvent,
    LocationDetailDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  LocationDetailDynamicByChosenAttributesBloc()
      : super(const LocationDetailDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadLocationDetailDynamicByChosenAttributesEvent>(
        onLoadLocationDetailDynamic);
  }

  FutureOr<void> onLoadLocationDetailDynamic(
      event, Emitter<LocationDetailDynamicByChosenAttributesState> emit) async {
    emit(const LocationDetailDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final allLocationDetailDynamicResponses =
          await _repositories.getLocationDetailDynamicByChosenAttributes(
        event.prefferedLocationCircularDiameter,
        event.membershipMaxDiameter,
        event.lat,
        event.lon,
      );

      emit(state.copyWith(
          status: Status.success,
          locationDetailDynamicList: allLocationDetailDynamicResponses));
    } catch (e) {
      LocationDetailDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
