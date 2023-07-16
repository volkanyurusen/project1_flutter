part of 'training_request_dynamic_requested_by_user_bloc.dart';

class TrainingRequestDynamicRequestedByUserState extends Equatable {
  final List<TrainingRequestDynamic> trainingRequestDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingRequestDynamicRequestedByUserState({
    this.trainingRequestDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingRequestDynamicRequestedByUserState copyWith({
    List<TrainingRequestDynamic>? trainingRequestDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingRequestDynamicRequestedByUserState(
      trainingRequestDynamicList:
          trainingRequestDynamicList ?? this.trainingRequestDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [trainingRequestDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'TrainingRequestDynamicRequestedByUserState(trainingRequestDynamicList: $trainingRequestDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
