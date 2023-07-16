part of 'index_of_message_tab_cubit.dart';

class IndexOfMessageTabState extends Equatable {
  final int currentIndex;

  const IndexOfMessageTabState({this.currentIndex = 0});

  IndexOfMessageTabState copyWith({
    int? currentIndex,
  }) {
    return IndexOfMessageTabState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [currentIndex];

  @override
  String toString() => 'IndexOfMessageTabState(currentIndex: $currentIndex)';
}
