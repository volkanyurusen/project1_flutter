import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_template_event.dart';
part 'activity_template_state.dart';

class ActivityTemplateBloc
    extends Bloc<ActivityTemplateEvent, ActivityTemplateState> {
  final Repositories _repositories = Repositories();

  ActivityTemplateBloc()
      : super(const ActivityTemplateState(status: Status.initial)) {
    on<AddActivityTemplateEvent>(_onAddActivityTemplateEvent);
    on<UpdateActivityTemplateEvent>(_onUpdateActivityTemplateEvent);
    on<DeleteActivityTemplateEvent>(_onDeleteActivityTemplateEvent);
  }

  FutureOr<void> _onAddActivityTemplateEvent(
      event, Emitter<ActivityTemplateState> emit) async {
    emit(const ActivityTemplateState(status: Status.loading));

    try {
      final allActivityTemplateResponses =
          await _repositories.postActivityTemplate(event.activityTemplate);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allActivityTemplateResponses));
    } catch (e) {
      ActivityTemplateState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateActivityTemplateEvent(
      event, Emitter<ActivityTemplateState> emit) async {
    emit(const ActivityTemplateState(status: Status.loading));

    try {
      final allActivityTemplateResponses =
          await _repositories.putActivityTemplate(event.activityTemplate);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allActivityTemplateResponses));
    } catch (e) {
      ActivityTemplateState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteActivityTemplateEvent(
      event, Emitter<ActivityTemplateState> emit) async {
    emit(const ActivityTemplateState(status: Status.loading));

    try {
      final allActivityTemplateResponses =
          await _repositories.deleteActivityTemplate(event.activityTemplateId);

      emit(state.copyWith(
          status: Status.success, dbStatusList: allActivityTemplateResponses));
    } catch (e) {
      ActivityTemplateState(status: Status.failure, error: e.toString());
    }
  }
}
