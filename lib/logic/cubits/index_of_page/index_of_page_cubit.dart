import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'index_of_page_state.dart';

class IndexOfPageCubit extends Cubit<IndexOfPageState> {
  IndexOfPageCubit() : super(const IndexOfPageState(currentIndex: 0));

  void pageChanged(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}
