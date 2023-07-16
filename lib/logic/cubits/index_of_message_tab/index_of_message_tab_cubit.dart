import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'index_of_message_tab_state.dart';

class IndexOfMessageTabCubit extends Cubit<IndexOfMessageTabState> {
  IndexOfMessageTabCubit() : super(const IndexOfMessageTabState(currentIndex: 0));

  void tabChanged(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}
