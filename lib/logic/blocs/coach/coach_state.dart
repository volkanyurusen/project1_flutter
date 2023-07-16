part of 'coach_bloc.dart';

class CoachState extends Equatable {
  final List<Coach> coachList;
  final String error;
  final Status status;

  const CoachState({
    this.coachList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CoachState copyWith({
    List<Coach>? coachList,
    String? error,
    Status? status,
  }) {
    return CoachState(
      coachList: coachList ?? this.coachList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [coachList, error, status];

  @override
  String toString() =>
      'UserState(CoachList: $coachList, error: $error, status: $status)';
}
