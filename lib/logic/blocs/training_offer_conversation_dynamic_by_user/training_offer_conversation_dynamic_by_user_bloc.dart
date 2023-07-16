import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_conversation_dynamic_by_user_event.dart';
part 'training_offer_conversation_dynamic_by_user_state.dart';

class TrainingOfferConversationDynamicByUserBloc extends Bloc<
    TrainingOfferConversationDynamicByUserEvent,
    TrainingOfferConversationDynamicByUserState> {
  final Repositories _repositories = Repositories();

  TrainingOfferConversationDynamicByUserBloc()
      : super(const TrainingOfferConversationDynamicByUserState(
            status: StatusWithoutLoading.initial)) {
    on<LoadTrainingOfferConversationDynamicByUserEvent>(
        _onLoadTrainingOfferConversationDynamicByUser);
  }

  FutureOr<void> _onLoadTrainingOfferConversationDynamicByUser(
      event, Emitter<TrainingOfferConversationDynamicByUserState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingOfferConversationDynamicByUserListResponses =
            await _repositories.getTrainingOfferConversationDynamicDataByUser(
                event.uId, event.offset);
        return trainingOfferConversationDynamicByUserListResponses.isEmpty ||
                trainingOfferConversationDynamicByUserListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferConversationDynamicList:
                    trainingOfferConversationDynamicByUserListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferConversationDynamicList:
                    trainingOfferConversationDynamicByUserListResponses,
                hasReachedMax: false));
      }
      final trainingOfferConversationDynamicByUserListResponses =
          await _repositories.getTrainingOfferConversationDynamicDataByUser(
              event.uId, event.offset);
      trainingOfferConversationDynamicByUserListResponses.isEmpty ||
              trainingOfferConversationDynamicByUserListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferConversationDynamicList: List.of(
                  state.trainingOfferConversationDynamicList)
                ..addAll(trainingOfferConversationDynamicByUserListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferConversationDynamicList: List.of(
                  state.trainingOfferConversationDynamicList)
                ..addAll(trainingOfferConversationDynamicByUserListResponses),
              hasReachedMax: false));
    } catch (e) {
      TrainingOfferConversationDynamicByUserState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }
}

// FutureOr<void> _onLoadTrainingOfferConversationDynamicByUser(
//     event, Emitter<TrainingOfferConversationDynamicByUserState> emit) async {
//   emit(const TrainingOfferConversationDynamicByUserState(
//       status: Status.loading));

//   try {
//     final trainingOfferConversationDynamicByUserListResponses =
//         await _repositories
//             .getTrainingOfferConversationDynamicDataByUser(event.uId);
//     emit(
//       state.copyWith(
//           status: Status.success,
//           trainingOfferConversationDynamicList:
//               trainingOfferConversationDynamicByUserListResponses),
//     );
//   } catch (e) {
//     TrainingOfferConversationDynamicByUserState(
//         status: Status.failure, error: e.toString());
//   }
// }
