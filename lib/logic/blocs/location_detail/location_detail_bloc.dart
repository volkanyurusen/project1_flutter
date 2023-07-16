import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'location_detail_event.dart';
part 'location_detail_state.dart';

class LocationDetailBloc
    extends Bloc<LocationDetailEvent, LocationDetailState> {
  final Repositories _repositories = Repositories();

  LocationDetailBloc()
      : super(const LocationDetailState(status: Status.initial)) {
    on<AddLocationDetailEvent>(_onAddLocationDetailEvent);
  }

  FutureOr<void> _onAddLocationDetailEvent(
      event, Emitter<LocationDetailState> emit) async {
    emit(const LocationDetailState(status: Status.loading));

    try {
      final allLocationDetailDynamicResponses =
          await _repositories.postLocationDetail(event.locationDetail);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allLocationDetailDynamicResponses));
    } catch (e) {
      LocationDetailState(status: Status.failure, error: e.toString());
    }
  }
}
