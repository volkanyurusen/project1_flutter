import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'location_template_dynamic_by_user_event.dart';
part 'location_template_dynamic_by_user_state.dart';

class LocationTemplateDynamicByUserBloc extends Bloc<
    LocationTemplateDynamicByUserEvent, LocationTemplateDynamicByUserState> {
  final Repositories _repositories = Repositories();

  LocationTemplateDynamicByUserBloc()
      : super(const LocationTemplateDynamicByUserState(
            status: StatusWithoutLoading.initial)) {
    on<LoadLocationTemplateDynamicByUserEvent>(
        _onLoadLocationTemplateDynamicByUser);
            on<RecallLocationTemplateDynamicByUserEvent>(
        _onRecallLocationTemplateDynamicByUserEvent);
  }

  FutureOr<void> _onLoadLocationTemplateDynamicByUser(
      event, Emitter<LocationTemplateDynamicByUserState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final locationTemplateDynamicByUserListResponses = await _repositories
            .getLocationTemplateDynamicDataByUser(event.uId, event.offset);
        return locationTemplateDynamicByUserListResponses.isEmpty ||
                locationTemplateDynamicByUserListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                locationTemplateDynamicList:
                    locationTemplateDynamicByUserListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                locationTemplateDynamicList:
                    locationTemplateDynamicByUserListResponses,
                hasReachedMax: false));
      }
      final locationTemplateDynamicByUserListResponses = await _repositories
          .getLocationTemplateDynamicDataByUser(event.uId, event.offset);
      locationTemplateDynamicByUserListResponses.isEmpty ||
              locationTemplateDynamicByUserListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              locationTemplateDynamicList:
                  List.of(state.locationTemplateDynamicList)
                    ..addAll(locationTemplateDynamicByUserListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              locationTemplateDynamicList:
                  List.of(state.locationTemplateDynamicList)
                    ..addAll(locationTemplateDynamicByUserListResponses),
              hasReachedMax: false));
    } catch (e) {
      LocationTemplateDynamicByUserState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

    FutureOr<void> _onRecallLocationTemplateDynamicByUserEvent(
      event, Emitter<LocationTemplateDynamicByUserState> emit) async {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        hasReachedMax: false,
        locationTemplateDynamicList:
            List.of(state.locationTemplateDynamicList..clear())));
  }
}



  // FutureOr<void> _onLoadLocationTemplateDynamicByUser(
  //     event, Emitter<LocationTemplateDynamicByUserState> emit) async {
  //   emit(const LocationTemplateDynamicByUserState(status: Status.loading));

  //   try {
  //     final locationTemplateDynamicByUserListResponses =
  //         await _repositories.getLocationTemplateDynamicDataByUser(event.uId);
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           locationTemplateDynamicList:
  //               locationTemplateDynamicByUserListResponses),
  //     );
  //   } catch (e) {
  //     LocationTemplateDynamicByUserState(
  //         status: Status.failure, error: e.toString());
  //   }