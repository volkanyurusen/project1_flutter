part of 'search_activity_by_chosen_recent_activity_cubit.dart';

class SearchActivityByChosenRecentActivityState extends Equatable {
  final List<RecentActivity> chosenRecentActivityList;

  const SearchActivityByChosenRecentActivityState({
    required this.chosenRecentActivityList,
  });

  @override
  List<Object?> get props => [chosenRecentActivityList];

  SearchActivityByChosenRecentActivityState copyWith({
    List<RecentActivity>? chosenRecentActivityList,
  }) {
    return SearchActivityByChosenRecentActivityState(
      chosenRecentActivityList: chosenRecentActivityList ??
          this.chosenRecentActivityList,
    );
  }

  @override
  String toString() =>
      'SearchActivityByChosenRecentActivityState(chosenRecentActivityList: $chosenRecentActivityList)';
}
