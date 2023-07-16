part of 'chosen_coaching_type_cubit.dart';

class ChosenCoachingTypeState extends Equatable {
  final List<CoachingType> chosenCoachingTypeList;

  const ChosenCoachingTypeState({
    required this.chosenCoachingTypeList,
  });

  ChosenCoachingTypeState copyWith({
    List<CoachingType>? chosenCoachingTypeList,
  }) {
    return ChosenCoachingTypeState(
      chosenCoachingTypeList:
          chosenCoachingTypeList ?? this.chosenCoachingTypeList,
    );
  }

  @override
  List<Object> get props => [chosenCoachingTypeList];
}
