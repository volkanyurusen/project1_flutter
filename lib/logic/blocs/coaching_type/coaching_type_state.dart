part of 'coaching_type_bloc.dart';

class CoachingTypeState extends Equatable {
  final List<CoachingType> coachingTypeList;
  final String error;
  final Status status;

  const CoachingTypeState({
    this.coachingTypeList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CoachingTypeState copyWith({
    List<CoachingType>? coachingTypeList,
    String? error,
    Status? status,
  }) {
    return CoachingTypeState(
      coachingTypeList: coachingTypeList ?? this.coachingTypeList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [coachingTypeList, error, status];

  @override
  String toString() =>
      'CoachingTypeState(coachingTypeList: $coachingTypeList, error: $error, status: $status)';
}
