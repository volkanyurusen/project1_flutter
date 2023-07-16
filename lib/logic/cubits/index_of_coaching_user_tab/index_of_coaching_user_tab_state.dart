part of 'index_of_coaching_user_tab_cubit.dart';

class IndexOfCoachingUserTabState extends Equatable {
  final int currentIndex;

  const IndexOfCoachingUserTabState({this.currentIndex = 0});

  IndexOfCoachingUserTabState copyWith({
    int? currentIndex,
  }) {
    return IndexOfCoachingUserTabState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [currentIndex];

  @override
  String toString() => 'IndexOfCoachingUserTabState(currentIndex: $currentIndex)';
}
