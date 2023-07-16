part of 'coaching_experience_dynamic_by_chosen_attributes_bloc.dart';

class CoachingExperienceDynamicByChosenAttributesState extends Equatable {
  final List<CoachingExperienceDynamic> coachingExperienceDynamicList;
  final String error;
  final Status status;

  const CoachingExperienceDynamicByChosenAttributesState({
    this.coachingExperienceDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CoachingExperienceDynamicByChosenAttributesState copyWith({
    List<CoachingExperienceDynamic>? coachingExperienceDynamicList,
    String? error,
    Status? status,
  }) {
    return CoachingExperienceDynamicByChosenAttributesState(
      coachingExperienceDynamicList:
          coachingExperienceDynamicList ?? this.coachingExperienceDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [coachingExperienceDynamicList, error, status];

  @override
  String toString() =>
      'CoachingExperienceDynamicByChosenAttributesState(coachingExperienceDynamicList: $coachingExperienceDynamicList, error: $error, status: $status)';
}
