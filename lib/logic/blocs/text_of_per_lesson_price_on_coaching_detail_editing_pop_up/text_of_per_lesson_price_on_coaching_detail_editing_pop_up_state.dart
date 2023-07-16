part of 'text_of_per_lesson_price_on_coaching_detail_editing_pop_up_bloc.dart';

// abstract class TextOfPerLessonPriceOnCoachingDetailEditingPopUpState extends Equatable {
//   const TextOfPerLessonPriceOnCoachingDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfPerLessonPriceOnCoachingDetailEditingPopUpState extends Equatable {
  final String? perLessonPrice;

  const TextOfPerLessonPriceOnCoachingDetailEditingPopUpState(
      {this.perLessonPrice = ''});

  TextOfPerLessonPriceOnCoachingDetailEditingPopUpState copyWith(
      {String? perLessonPrice}) {
    return TextOfPerLessonPriceOnCoachingDetailEditingPopUpState(
        perLessonPrice: perLessonPrice ?? this.perLessonPrice);
  }

  @override
  List<Object?> get props => [perLessonPrice!];

  @override
  String toString() =>
      'TextOfPerLessonPriceOnCoachingDetailEditingPopUpState(price: $perLessonPrice)';
}
