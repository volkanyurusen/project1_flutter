import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';

part 'search_activity_by_chosen_recent_activity_state.dart';

class SearchActivityByChosenRecentActivityCubit
    extends Cubit<SearchActivityByChosenRecentActivityState> {
  SearchActivityByChosenRecentActivityCubit()
      : super(SearchActivityByChosenRecentActivityState(
            chosenRecentActivityList: []));

  void pressedSearchActivityByChosenRecentActivity(
      RecentActivity recentActivity) {
    final statusState = state;

    if (statusState.chosenRecentActivityList.isNotEmpty) {
      statusState.chosenRecentActivityList.clear();
    }
    emit(statusState.copyWith(
        chosenRecentActivityList:
            List.from(statusState.chosenRecentActivityList)
              ..add(recentActivity)));
    //  else {
    //   emit(statusState.copyWith(
    //       chosenRecentActivityList:
    //           List.from(statusState.chosenRecentActivityList)
    //             ..add(recentActivity)));
    // }
  }

  void cleanSearchActivities() {
    if (state.chosenRecentActivityList.isNotEmpty) {
      state.chosenRecentActivityList.clear();
    }
  }
}
