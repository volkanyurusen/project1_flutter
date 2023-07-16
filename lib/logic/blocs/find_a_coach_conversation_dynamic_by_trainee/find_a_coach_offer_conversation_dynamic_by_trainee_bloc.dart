import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'find_a_coach_offer_conversation_dynamic_by_trainee_event.dart';
part 'find_a_coach_offer_conversation_dynamic_by_trainee_state.dart';

class FindACoachConversationDynamicByTraineeBloc extends Bloc<
    FindACoachConversationDynamicByTraineeEvent,
    FindACoachConversationDynamicByTraineeState> {
  final Repositories _repositories = Repositories();

  FindACoachConversationDynamicByTraineeBloc()
      : super(const FindACoachConversationDynamicByTraineeState(
            status: StatusWithoutLoading.initial)) {
    on<LoadFindACoachConversationDynamicByTraineeEvent>(
        _onLoadFindACoachConversationDynamicByUser);
  }

  FutureOr<void> _onLoadFindACoachConversationDynamicByUser(
      event, Emitter<FindACoachConversationDynamicByTraineeState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final findACoachConversationDynamicByTraineeListResponses =
            await _repositories.getFindACoachConversationDynamicDataByTrainee(
                event.traineeId, event.offset);
        return findACoachConversationDynamicByTraineeListResponses.isEmpty ||
                findACoachConversationDynamicByTraineeListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                findACoachConversationDynamicList:
                    findACoachConversationDynamicByTraineeListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                findACoachConversationDynamicList:
                    findACoachConversationDynamicByTraineeListResponses,
                hasReachedMax: false));
      }
      final findACoachConversationDynamicByTraineeListResponses =
          await _repositories.getFindACoachConversationDynamicDataByTrainee(
              event.traineeId, event.offset);
      findACoachConversationDynamicByTraineeListResponses.isEmpty ||
              findACoachConversationDynamicByTraineeListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              findACoachConversationDynamicList: List.of(
                  state.findACoachConversationDynamicList)
                ..addAll(findACoachConversationDynamicByTraineeListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              findACoachConversationDynamicList: List.of(
                  state.findACoachConversationDynamicList)
                ..addAll(findACoachConversationDynamicByTraineeListResponses),
              hasReachedMax: false));
    } catch (e) {
      FindACoachConversationDynamicByTraineeState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }
}

// FutureOr<void> _onLoadFindACoachConversationDynamicByUser(
//     event, Emitter<FindACoachConversationDynamicByTraineeState> emit) async {
//   emit(const FindACoachConversationDynamicByTraineeState(
//       status: Status.loading));

//   try {
//     final findACoachConversationDynamicByTraineeListResponses =
//         await _repositories
//             .getFindACoachConversationDynamicDataByTrainee(event.traineeId);
//     emit(
//       state.copyWith(
//           status: Status.success,
//           findACoachConversationDynamicList:
//               findACoachConversationDynamicByTraineeListResponses),
//     );
//   } catch (e) {
//     FindACoachConversationDynamicByTraineeState(
//         status: Status.failure, error: e.toString());
//   }
// }
