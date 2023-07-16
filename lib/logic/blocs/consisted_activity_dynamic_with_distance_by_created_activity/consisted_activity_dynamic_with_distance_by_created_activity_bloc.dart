import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'consisted_activity_dynamic_with_distance_by_created_activity_event.dart';
part 'consisted_activity_dynamic_with_distance_by_created_activity_state.dart';

class ConsistedActivityDynamicWithDistanceByCreatedActivityBloc extends Bloc<
    ConsistedActivityDynamicWithDistanceByCreatedActivityEvent,
    ConsistedActivityDynamicWithDistanceByCreatedActivityState> {
  final Repositories _repositories = Repositories();
  //
  // final ConsistedActivityDynamicWithDistanceByCreatedActivityRepository
  //     _consistedActivityDynamicWithDistanceByCreatedActivityRepository =
  //     ConsistedActivityDynamicWithDistanceByCreatedActivityRepository();

  ConsistedActivityDynamicWithDistanceByCreatedActivityBloc()
      : super(const ConsistedActivityDynamicWithDistanceByCreatedActivityState(
            status: Status.initial)) {
    on<LoadConsistedActivityDynamicWithDistanceByCreatedActivityEvent>(
        _onLoadConsistedActivityDynamicWithDistanceByCreatedActivity);
  }

  FutureOr<void> _onLoadConsistedActivityDynamicWithDistanceByCreatedActivity(
      event,
      Emitter<ConsistedActivityDynamicWithDistanceByCreatedActivityState>
          emit) async {
    emit(const ConsistedActivityDynamicWithDistanceByCreatedActivityState(
        status: Status.loading));

    try {
      final consistedActivityDynamicWithDistanceByCreatedActivityListResponses =
          await _repositories
              .getConsistedActivityDynamicWithDistanceDataCreatedByUser(
                  event.createdActivityId);
      //
      // await _consistedActivityDynamicWithDistanceByCreatedActivityRepository
      //     .getConsistedActivityDynamicWithDistanceByCreatedActivityData(
      //         event.createdActivityId);
      //
      // if (kDebugMode) {
      //   print(
      //       'consistedActivityDynamicWithDistanceByCreatedActivityListResponses: $consistedActivityDynamicWithDistanceByCreatedActivityListResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            consistedActivityDynamicWithDistanceList:
                consistedActivityDynamicWithDistanceByCreatedActivityListResponses),
      );
    } catch (e) {
      ConsistedActivityDynamicWithDistanceByCreatedActivityState(
          status: Status.failure, error: e.toString());
    }
  }
}
