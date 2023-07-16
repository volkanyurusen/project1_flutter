import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/model_dbs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'coach_db_event.dart';
part 'coach_db_state.dart';

class CoachDBBloc extends Bloc<CoachDBEvent, CoachDBState> {
  final Repositories _repositories = Repositories();

  CoachDBBloc() : super(const CoachDBState(status: Status.initial)) {
    // on<AddCoachDBEvent>(_onAddActivityDetailDynamic);
    on<UpdateCoachDBEvent>(_onUpdateCoachDBEvent);
    // on<DeleteCoachDBEvent>(_onDeleteActivityDetailDynamic);
  }

  // FutureOr<void> _onAddActivityDetailDynamic(
  //     event, Emitter<CoachDBState> emit) async {
  //   emit(const CoachDBState(status: Status.loading));

  //   try {
  //     final allActivityDetailDynamicResponses =
  //         await _repositories.postCoachDB(event.coachDB);

  //     emit(state.copyWith(
  //         status: Status.success,
  //         dbStatusList: allActivityDetailDynamicResponses));
  //   } catch (e) {
  //     CoachDBState(status: Status.failure, error: e.toString());
  //   }
  // }

  FutureOr<void> _onUpdateCoachDBEvent(
      event, Emitter<CoachDBState> emit) async {
    emit(const CoachDBState(status: Status.loading));

    try {
      final allActivityDetailDynamicResponses =
          await _repositories.putCoach(event.coachDB);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allActivityDetailDynamicResponses));
    } catch (e) {
      CoachDBState(status: Status.failure, error: e.toString());
    }
  }

  // FutureOr<void> _onDeleteActivityDetailDynamic(
  //     event, Emitter<CoachDBState> emit) async {
  //   emit(const CoachDBState(status: Status.loading));

  //   try {
  //     final allActivityDetailDynamicResponses =
  //         await _repositories.deleteCoachDB(event.coachDBId);

  //     emit(state.copyWith(
  //         status: Status.success,
  //         dbStatusList: allActivityDetailDynamicResponses));
  //   } catch (e) {
  //     CoachDBState(status: Status.failure, error: e.toString());
  //   }
  // }
}
