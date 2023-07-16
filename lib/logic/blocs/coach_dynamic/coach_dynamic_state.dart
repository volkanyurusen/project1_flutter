part of 'coach_dynamic_bloc.dart';

class CoachDynamicState extends Equatable {
  final List<CoachDynamic> coachDynamicList;
  final String error;
  final Status status;

  const CoachDynamicState({
    this.coachDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CoachDynamicState copyWith({
    List<CoachDynamic>? coachDynamicList,
    String? error,
    Status? status,
  }) {
    return CoachDynamicState(
      coachDynamicList: coachDynamicList ?? this.coachDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [coachDynamicList, error, status];

  @override
  String toString() =>
      'UserDynamicState(CoachDynamicList: $coachDynamicList, error: $error, status: $status)';
}
