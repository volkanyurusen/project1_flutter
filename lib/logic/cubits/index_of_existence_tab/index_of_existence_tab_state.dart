part of 'index_of_existence_tab_cubit.dart';

class IndexOfExistenceTabState extends Equatable {
  final int currentIndex;

  const IndexOfExistenceTabState({this.currentIndex = 0});

  IndexOfExistenceTabState copyWith({
    int? currentIndex,
  }) {
    return IndexOfExistenceTabState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [currentIndex];

  @override
  String toString() => 'IndexOfExistenceTabState(currentIndex: $currentIndex)';
}
