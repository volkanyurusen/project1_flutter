import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'created_activity_event.dart';
part 'created_activity_state.dart';

class CreatedActivityBloc
    extends Bloc<CreatedActivityEvent, CreatedActivityState> {
  final Repositories _repositories = Repositories();

  CreatedActivityBloc()
      : super(const CreatedActivityState(status: Status.initial)) {
    on<AddCreatedActivityEvent>(_onAddCreatedActivityEvent);
    on<UpdateCreatedActivityEvent>(_onUpdateCreatedActivityEvent);
    on<DeleteCreatedActivityEvent>(_onDeleteCreatedActivityEvent);
  }

  FutureOr<void> _onAddCreatedActivityEvent(
      event, Emitter<CreatedActivityState> emit) async {
    emit(const CreatedActivityState(status: Status.loading));

    try {
      final allCreatedActivityResponses =
          await _repositories.postCreatedActivity(event.createdActivity);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allCreatedActivityResponses));
    } catch (e) {
      CreatedActivityState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateCreatedActivityEvent(
      event, Emitter<CreatedActivityState> emit) async {
    emit(const CreatedActivityState(status: Status.loading));

    try {
      final allCreatedActivityResponses =
          await _repositories.putCreatedActivity(event.createdActivity);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allCreatedActivityResponses));
    } catch (e) {
      CreatedActivityState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteCreatedActivityEvent(
      event, Emitter<CreatedActivityState> emit) async {
    emit(const CreatedActivityState(status: Status.loading));

    try {
      final allCreatedActivityResponses =
          await _repositories.deleteCreatedActivity(event.createdActivityId);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allCreatedActivityResponses));
    } catch (e) {
      CreatedActivityState(status: Status.failure, error: e.toString());
    }
  }
}
