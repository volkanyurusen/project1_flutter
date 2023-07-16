import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'consisted_activity_event.dart';
part 'consisted_activity_state.dart';

class ConsistedActivityBloc
    extends Bloc<ConsistedActivityEvent, ConsistedActivityState> {
  final Repositories _repositories = Repositories();

  ConsistedActivityBloc()
      : super(const ConsistedActivityState(status: Status.initial)) {
    on<AddConsistedActivityEvent>(_onAddConsistedActivityEvent);
    on<UpdateConsistedActivityEvent>(_onUpdateConsistedActivityEvent);
    on<DeleteConsistedActivityEvent>(_onDeleteConsistedActivityEvent);
  }

  FutureOr<void> _onAddConsistedActivityEvent(
      event, Emitter<ConsistedActivityState> emit) async {
    emit(const ConsistedActivityState(status: Status.loading));

    try {
      final allConsistedActivityResponses =
          await _repositories.postConsistedActivity(event.consistedActivity);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allConsistedActivityResponses));
    } catch (e) {
      ConsistedActivityState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateConsistedActivityEvent(
      event, Emitter<ConsistedActivityState> emit) async {
    emit(const ConsistedActivityState(status: Status.loading));

    try {
      final allConsistedActivityResponses =
          await _repositories.putConsistedActivity(event.consistedActivity);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allConsistedActivityResponses));
    } catch (e) {
      ConsistedActivityState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteConsistedActivityEvent(
      event, Emitter<ConsistedActivityState> emit) async {
    emit(const ConsistedActivityState(status: Status.loading));

    try {
      final allConsistedActivityResponses =
          await _repositories.deleteConsistedActivity(event.consistedActivityId);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allConsistedActivityResponses));
    } catch (e) {
      ConsistedActivityState(status: Status.failure, error: e.toString());
    }
  }
}
