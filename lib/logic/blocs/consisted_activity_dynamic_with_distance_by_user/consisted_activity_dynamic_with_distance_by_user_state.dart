part of 'consisted_activity_dynamic_with_distance_by_user_bloc.dart';

class ConsistedActivityDynamicWithDistanceByUserState extends Equatable {
  final List<ConsistedActivityDynamicWithDistance>
      consistedActivityDynamicWithDistanceList;
  final String error;
  final Status status;

  const ConsistedActivityDynamicWithDistanceByUserState({
    this.consistedActivityDynamicWithDistanceList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ConsistedActivityDynamicWithDistanceByUserState copyWith({
    List<ConsistedActivityDynamicWithDistance>?
        consistedActivityDynamicWithDistanceList,
    String? error,
    Status? status,
  }) {
    return ConsistedActivityDynamicWithDistanceByUserState(
      consistedActivityDynamicWithDistanceList:
          consistedActivityDynamicWithDistanceList ??
              this.consistedActivityDynamicWithDistanceList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [consistedActivityDynamicWithDistanceList, error, status];

  @override
  String toString() =>
      'ConsistedActivityDynamicWithDistanceByUserState(consistedActivityDynamicWithDistanceList: $consistedActivityDynamicWithDistanceList, error: $error, status: $status)';
}
