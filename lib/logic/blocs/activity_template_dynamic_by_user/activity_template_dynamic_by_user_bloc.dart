import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_template_dynamic_by_user_event.dart';
part 'activity_template_dynamic_by_user_state.dart';

class ActivityTemplateDynamicByUserBloc extends Bloc<
    ActivityTemplateDynamicByUserEvent, ActivityTemplateDynamicByUserState> {
  final Repositories _repositories = Repositories();

  ActivityTemplateDynamicByUserBloc()
      : super(const ActivityTemplateDynamicByUserState(
            status: StatusWithoutLoading.initial)) {
    on<LoadActivityTemplateDynamicByUserEvent>(
        _onLoadActivityTemplateDynamicByUser);
    on<RecallActivityTemplateDynamicByUserEvent>(
        _onRecallActivityTemplateDynamicByUserEvent);
  }

  FutureOr<void> _onLoadActivityTemplateDynamicByUser(
      event, Emitter<ActivityTemplateDynamicByUserState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final activityTemplateDynamicByUserListResponses = await _repositories
            .getActivityTemplateDynamicDataByUser(event.uId, event.offset);
        return activityTemplateDynamicByUserListResponses.isEmpty ||
                activityTemplateDynamicByUserListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                activityTemplateDynamicList:
                    activityTemplateDynamicByUserListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                activityTemplateDynamicList:
                    activityTemplateDynamicByUserListResponses,
                hasReachedMax: false));
      }
      final activityTemplateDynamicByUserListResponses = await _repositories
          .getActivityTemplateDynamicDataByUser(event.uId, event.offset);
      activityTemplateDynamicByUserListResponses.isEmpty ||
              activityTemplateDynamicByUserListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              activityTemplateDynamicList:
                  List.of(state.activityTemplateDynamicList)
                    ..addAll(activityTemplateDynamicByUserListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              activityTemplateDynamicList:
                  List.of(state.activityTemplateDynamicList)
                    ..addAll(activityTemplateDynamicByUserListResponses),
              hasReachedMax: false));
    } catch (e) {
      ActivityTemplateDynamicByUserState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallActivityTemplateDynamicByUserEvent(
      event, Emitter<ActivityTemplateDynamicByUserState> emit) async {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        hasReachedMax: false,
        activityTemplateDynamicList:
            List.of(state.activityTemplateDynamicList..clear())));
  }
}



  // FutureOr<void> _onLoadActivityTemplateDynamicByUser(
  //     event, Emitter<ActivityTemplateDynamicByUserState> emit) async {
  //   emit(const ActivityTemplateDynamicByUserState(status: Status.loading));

  //   try {
  //     final activityTemplateDynamicByUserListResponses =
  //         await _repositories.getActivityTemplateDynamicDataByUser(event.uId, event.offset);
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           activityTemplateDynamicList:
  //               activityTemplateDynamicByUserListResponses),
  //     );
  //   } catch (e) {
  //     ActivityTemplateDynamicByUserState(
  //         status: Status.failure, error: e.toString());
  //   }
