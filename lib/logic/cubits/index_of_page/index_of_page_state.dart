part of 'index_of_page_cubit.dart';

class IndexOfPageState extends Equatable {
  final int currentIndex;
  const IndexOfPageState({required this.currentIndex});

  IndexOfPageState copyWith({
    int? currentIndex,
  }) {
    return IndexOfPageState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [currentIndex];

  @override
  String toString() => 'IndexOfPageState(currentIndex: $currentIndex)';
}
