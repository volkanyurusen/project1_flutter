import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'result_of_chosen_activity_dynamic_event.dart';
part 'result_of_chosen_activity_dynamic_state.dart';

// const throttleDuration = Duration(milliseconds: 100);

// EventTransformer<E> throttleDroppable<E>(Duration duration) {
//   return (events, mapper) {
//     return droppable<E>().call(events.throttle(duration), mapper);
//   };
// }

class ResultOfChosenActivityDynamicBloc extends Bloc<
    ResultOfChosenActivityDynamicEvent, ResultOfChosenActivityDynamicState> {
  final Repositories _repositories = Repositories();

  ResultOfChosenActivityDynamicBloc()
      : super(const ResultOfChosenActivityDynamicState(
            status: StatusWithoutLoading.initial)) {
    on<LoadResultOfChosenActivityDynamic>(_onLoadResultOfChosenActivityDynamic);
    on<CleanResultOfChosenActivityDynamic>(
        _onCleanedResultOfChosenActivityDynamic);
    // on<RecallResultOfChosenActivityDynamic>(
    //     _onRecallResultOfChosenActivityDynamic);
  }

  FutureOr<void> _onLoadResultOfChosenActivityDynamic(
      LoadResultOfChosenActivityDynamic event,
      Emitter<ResultOfChosenActivityDynamicState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final resultOfChosenActivityDynamicListResponses =
            await _repositories.getResultOfChosenActivityDynamicData(
                event.uId,
                event.activityTypeDetailList,
                event.activityTitleList,
                event.locationCircularDiamter,
                event.lat,
                event.lon,
                event.offset);
        return resultOfChosenActivityDynamicListResponses.isEmpty ||
                resultOfChosenActivityDynamicListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                resultOfChosenActivityDynamicList:
                    resultOfChosenActivityDynamicListResponses,
                hasReachedMax: true,
                hasNewAttendance: false))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                resultOfChosenActivityDynamicList:
                    resultOfChosenActivityDynamicListResponses,
                hasReachedMax: false,
                hasNewAttendance: false));
      }
      final resultOfChosenActivityDynamicListResponses =
          await _repositories.getResultOfChosenActivityDynamicData(
              event.uId,
              event.activityTypeDetailList,
              event.activityTitleList,
              event.locationCircularDiamter,
              event.lat,
              event.lon,
              event.offset);
      resultOfChosenActivityDynamicListResponses.isEmpty ||
              resultOfChosenActivityDynamicListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              resultOfChosenActivityDynamicList:
                  List.of(state.resultOfChosenActivityDynamicList)
                    ..addAll(resultOfChosenActivityDynamicListResponses),
              hasReachedMax: true,
              hasNewAttendance: false))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              resultOfChosenActivityDynamicList:
                  List.of(state.resultOfChosenActivityDynamicList)
                    ..addAll(resultOfChosenActivityDynamicListResponses),
              hasReachedMax: false,
              hasNewAttendance: false));
    } catch (e) {
      emit(state.copyWith(
          status: StatusWithoutLoading.failure, error: e.toString()));
    }
  }

  void _onCleanedResultOfChosenActivityDynamic(
      CleanResultOfChosenActivityDynamic event,
      Emitter<ResultOfChosenActivityDynamicState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        resultOfChosenActivityDynamicList:
            List.of(state.resultOfChosenActivityDynamicList)..clear(),
        hasReachedMax: false,
        hasNewAttendance: false));
  }

  // void _onRecallResultOfChosenActivityDynamic(
  //     RecallResultOfChosenActivityDynamic event,
  //     Emitter<ResultOfChosenActivityDynamicState> emit) {
  //   emit(state.copyWith(
  //     status: StatusWithoutLoading.success,
  //     hasNewAttendance: true,
  //   ));
  // }
}

// Future<void> _onPostFetched(
//   PostFetched event,
//   Emitter<PostState> emit,
// ) async {
//   if (state.hasReachedMax) return;
//   try {
//     if (state.status == PostStatus.initial) {
//       final posts = await _fetchPosts();
//       return emit(
//         state.copyWith(
//           status: PostStatus.success,
//           posts: posts,
//           hasReachedMax: false,
//         ),
//       );
//     }
//     final posts = await _fetchPosts(state.posts.length);
//     posts.isEmpty
//         ? emit(state.copyWith(hasReachedMax: true))
//         : emit(
//             state.copyWith(
//               status: PostStatus.success,
//               posts: List.of(state.posts)..addAll(posts),
//               hasReachedMax: false,
//             ),
//           );
//   } catch (_) {
//     emit(state.copyWith(status: PostStatus.failure));
//   }
// }


