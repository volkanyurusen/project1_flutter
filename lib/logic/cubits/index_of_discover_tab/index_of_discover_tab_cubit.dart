import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'index_of_discover_tab_state.dart';

class IndexOfDiscoverTabCubit extends Cubit<IndexOfDiscoverTabState> {
  IndexOfDiscoverTabCubit() : super(const IndexOfDiscoverTabState(currentIndex: 0));

  void tabChanged(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}
