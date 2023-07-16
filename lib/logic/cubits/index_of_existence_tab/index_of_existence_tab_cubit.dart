import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'index_of_existence_tab_state.dart';

class IndexOfExistenceTabCubit extends Cubit<IndexOfExistenceTabState> {
  IndexOfExistenceTabCubit() : super(const IndexOfExistenceTabState(currentIndex: 0));

  void tabChanged(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}
