part of 'index_of_discover_tab_cubit.dart';

class IndexOfDiscoverTabState extends Equatable {
  final int currentIndex;

  const IndexOfDiscoverTabState({this.currentIndex = 0});

  IndexOfDiscoverTabState copyWith({
    int? currentIndex,
  }) {
    return IndexOfDiscoverTabState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [currentIndex];

  @override
  String toString() => 'IndexOfDiscoverTabState(currentIndex: $currentIndex)';
}
