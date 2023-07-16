import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'index_of_coaching_coach_tab_state.dart';

class IndexOfCoachingCoachTabCubit extends Cubit<IndexOfCoachingCoachTabState> {
  IndexOfCoachingCoachTabCubit() : super(const IndexOfCoachingCoachTabState(currentIndex: 0));

  void tabChanged(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}
