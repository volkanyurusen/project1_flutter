import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_reading/xmodels_reading.dart';
import 'package:my_project/repositories/repositories.dart';

part 'result_of_preferred_activity_dynamic_event.dart';
part 'result_of_preferred_activity_dynamic_state.dart';

// const throttleDuration = Duration(milliseconds: 100);

// EventTransformer<E> throttleDroppable<E>(Duration duration) {
//   return (events, mapper) {
//     return droppable<E>().call(events.throttle(duration), mapper);
//   };
// }

class ResultOfPreferredActivityDynamicBloc extends Bloc<
    ResultOfPreferredActivityDynamicEvent,
    ResultOfPreferredActivityDynamicState> {
  final Repositories _repositories = Repositories();

  ResultOfPreferredActivityDynamicBloc()
      : super(const ResultOfPreferredActivityDynamicState(
            status: StatusWithoutLoading.initial)) {
    on<LoadResultOfPreferredActivityDynamic>(
        _onLoadResultOfPreferredActivityDynamic);
    on<CleanResultOfPreferredActivityDynamic>(
        _onCleanedResultOfPreferredActivityDynamic);
    // on<RecallResultOfPreferredActivityDynamic>(
    //     _onRecallResultOfPreferredActivityDynamic);
  }

  FutureOr<void> _onLoadResultOfPreferredActivityDynamic(
      LoadResultOfPreferredActivityDynamic event,
      Emitter<ResultOfPreferredActivityDynamicState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final resultOfPreferredActivityDynamicListResponses =
            await _repositories.getResultOfPreferredActivityDynamicData(
                event.uId,
                event.activityTitle,
                event.locationCircularDiamter,
                event.lat,
                event.lon,
                event.offset);
        return resultOfPreferredActivityDynamicListResponses.isEmpty ||
                resultOfPreferredActivityDynamicListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                resultOfPreferredActivityDynamicList:
                    resultOfPreferredActivityDynamicListResponses,
                hasReachedMax: true,
                hasNewAttendance: false))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                resultOfPreferredActivityDynamicList:
                    resultOfPreferredActivityDynamicListResponses,
                hasReachedMax: false,
                hasNewAttendance: false));
      }
      final resultOfPreferredActivityDynamicListResponses =
          await _repositories.getResultOfPreferredActivityDynamicData(
              event.uId,
              event.activityTitle,
              event.locationCircularDiamter,
              event.lat,
              event.lon,
              event.offset);
      resultOfPreferredActivityDynamicListResponses.isEmpty ||
              resultOfPreferredActivityDynamicListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              resultOfPreferredActivityDynamicList:
                  List.of(state.resultOfPreferredActivityDynamicList)
                    ..addAll(resultOfPreferredActivityDynamicListResponses),
              hasReachedMax: true,
              hasNewAttendance: false))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              resultOfPreferredActivityDynamicList:
                  List.of(state.resultOfPreferredActivityDynamicList)
                    ..addAll(resultOfPreferredActivityDynamicListResponses),
              hasReachedMax: false,
              hasNewAttendance: false));
    } catch (e) {
      emit(state.copyWith(
          status: StatusWithoutLoading.failure, error: e.toString()));
    }
  }

  void _onCleanedResultOfPreferredActivityDynamic(
      CleanResultOfPreferredActivityDynamic event,
      Emitter<ResultOfPreferredActivityDynamicState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        resultOfPreferredActivityDynamicList:
            List.of(state.resultOfPreferredActivityDynamicList)..clear(),
        hasReachedMax: false,
        hasNewAttendance: false));
  }

  // void _onRecallResultOfPreferredActivityDynamic(
  //     RecallResultOfPreferredActivityDynamic event,
  //     Emitter<ResultOfPreferredActivityDynamicState> emit) {
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


