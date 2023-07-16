part of 'coaching_experience_dynamic_bloc.dart';

class CoachingExperienceDynamicState extends Equatable {
  final List<CoachingExperienceDynamic> coachingExperienceDynamicList;
  final String error;
  final Status status;

  const CoachingExperienceDynamicState({
    this.coachingExperienceDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CoachingExperienceDynamicState copyWith({
    List<CoachingExperienceDynamic>? coachingExperienceDynamicList,
    String? error,
    Status? status,
  }) {
    return CoachingExperienceDynamicState(
      coachingExperienceDynamicList:
          coachingExperienceDynamicList ?? this.coachingExperienceDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [coachingExperienceDynamicList, error, status];

  @override
  String toString() =>
      'CoachingExperienceDynamicState(CoachingExperienceDynamicList: $coachingExperienceDynamicList, error: $error, status: $status)';
}
