import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'consisted_activity_dynamic_with_distance_by_user_event.dart';
part 'consisted_activity_dynamic_with_distance_by_user_state.dart';

class ConsistedActivityDynamicWithDistanceByUserBloc extends Bloc<
    ConsistedActivityDynamicWithDistanceByUserEvent,
    ConsistedActivityDynamicWithDistanceByUserState> {
  final Repositories _repositories = Repositories();
  //
  // final ConsistedActivityDynamicWithDistanceByUserRepository
  //     _consistedActivityDynamicWithDistanceByUserRepository =
  //     ConsistedActivityDynamicWithDistanceByUserRepository();

  ConsistedActivityDynamicWithDistanceByUserBloc()
      : super(const ConsistedActivityDynamicWithDistanceByUserState(
            status: Status.initial)) {
    on<LoadConsistedActivityDynamicWithDistanceByUserEvent>(
        _onLoadConsistedActivityDynamicWithDistanceByUser);
  }

  FutureOr<void> _onLoadConsistedActivityDynamicWithDistanceByUser(event,
      Emitter<ConsistedActivityDynamicWithDistanceByUserState> emit) async {
    emit(const ConsistedActivityDynamicWithDistanceByUserState(
        status: Status.loading));

    try {
      final consistedActivityDynamicWithDistanceByUserListResponses =
          await _repositories
              .getConsistedActivityDynamicWithDistanceDataByUser(event.uId);
      //
      // await _consistedActivityDynamicWithDistanceByUserRepository
      //     .getConsistedActivityDynamicWithDistanceByUserData(event.uId);
      //
      // if (kDebugMode) {
      //   print(
      //       'consistedActivityDynamicWithDistanceByUserListResponses: $consistedActivityDynamicWithDistanceByUserListResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            consistedActivityDynamicWithDistanceList:
                consistedActivityDynamicWithDistanceByUserListResponses),
      );
    } catch (e) {
      ConsistedActivityDynamicWithDistanceByUserState(
          status: Status.failure, error: e.toString());
    }
  }
}
