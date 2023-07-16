part of 'text_of_min_lesson_on_coaching_detail_editing_pop_up_bloc.dart';

// abstract class TextOfMinLessonOnCoachingDetailEditingPopUpState extends Equatable {
//   const TextOfMinLessonOnCoachingDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfMinLessonOnCoachingDetailEditingPopUpState extends Equatable {
  final String? minLesson;

  const TextOfMinLessonOnCoachingDetailEditingPopUpState({this.minLesson = ''});

  TextOfMinLessonOnCoachingDetailEditingPopUpState copyWith(
      {String? minLesson}) {
    return TextOfMinLessonOnCoachingDetailEditingPopUpState(
        minLesson: minLesson ?? this.minLesson);
  }

  @override
  List<Object?> get props => [minLesson!];

  @override
  String toString() =>
      'TextOfMinLessonOnCoachingDetailEditingPopUpState(minLesson: $minLesson)';
}
