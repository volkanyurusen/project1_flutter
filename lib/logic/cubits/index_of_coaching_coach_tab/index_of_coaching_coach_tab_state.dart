part of 'index_of_coaching_coach_tab_cubit.dart';

class IndexOfCoachingCoachTabState extends Equatable {
  final int currentIndex;

  const IndexOfCoachingCoachTabState({this.currentIndex = 0});

  IndexOfCoachingCoachTabState copyWith({
    int? currentIndex,
  }) {
    return IndexOfCoachingCoachTabState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [currentIndex];

  @override
  String toString() => 'IndexOfCoachingCoachTabState(currentIndex: $currentIndex)';
}
