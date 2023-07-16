part of 'consisted_activity_dynamic_with_distance_by_created_activity_bloc.dart';

class ConsistedActivityDynamicWithDistanceByCreatedActivityState
    extends Equatable {
  final List<ConsistedActivityDynamicWithDistance>
      consistedActivityDynamicWithDistanceList;
  final String error;
  final Status status;

  const ConsistedActivityDynamicWithDistanceByCreatedActivityState({
    this.consistedActivityDynamicWithDistanceList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ConsistedActivityDynamicWithDistanceByCreatedActivityState copyWith({
    List<ConsistedActivityDynamicWithDistance>?
        consistedActivityDynamicWithDistanceList,
    String? error,
    Status? status,
  }) {
    return ConsistedActivityDynamicWithDistanceByCreatedActivityState(
      consistedActivityDynamicWithDistanceList:
          consistedActivityDynamicWithDistanceList ??
              this.consistedActivityDynamicWithDistanceList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        consistedActivityDynamicWithDistanceList,
        error,
        status
      ];

  @override
  String toString() =>
      'ConsistedActivityDynamicWithDistanceByCreatedActivityState(consistedActivityDynamicWithDistanceList: $consistedActivityDynamicWithDistanceList, error: $error, status: $status)';
}
