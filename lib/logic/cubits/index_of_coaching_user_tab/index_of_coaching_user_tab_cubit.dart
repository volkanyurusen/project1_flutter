import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'index_of_coaching_user_tab_state.dart';

class IndexOfCoachingUserTabCubit extends Cubit<IndexOfCoachingUserTabState> {
  IndexOfCoachingUserTabCubit() : super(const IndexOfCoachingUserTabState(currentIndex: 0));

  void tabChanged(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}
