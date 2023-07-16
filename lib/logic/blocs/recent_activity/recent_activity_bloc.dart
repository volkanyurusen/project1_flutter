import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'recent_activity_event.dart';
part 'recent_activity_state.dart';

class RecentActivityBloc
    extends Bloc<RecentActivityEvent, RecentActivityState> {
  final Repositories _repositories = Repositories();
  //
  // final RecentActivityRepository _recentActivityRepository =
  //     RecentActivityRepository();

  RecentActivityBloc()
      : super(const RecentActivityState(status: Status.initial)) {
    on<LoadRecentActivityEvent>(_onLoadRecentActivity);
  }

  FutureOr<void> _onLoadRecentActivity(
      event, Emitter<RecentActivityState> emit) async {
    emit(const RecentActivityState(status: Status.loading));

    try {
      final recentActivityListResponses =
          await _repositories.getRecentActivityDataByUser(event.uId);
      //
      // await _recentActivityRepository.getRecentActivityData(event.uId);
      //
      // if (kDebugMode) {
      //   print('recentActivityListResponses: $recentActivityListResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            recentActivityList: recentActivityListResponses),
      );
    } catch (e) {
      RecentActivityState(status: Status.failure, error: e.toString());
    }
  }
}
