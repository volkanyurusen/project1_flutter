part of 'recent_activity_bloc.dart';

class RecentActivityState extends Equatable {
  final List<RecentActivity> recentActivityList;
  final String error;
  final Status status;

  const RecentActivityState({
    this.recentActivityList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  RecentActivityState copyWith({
    List<RecentActivity>? recentActivityList,
    String? error,
    Status? status,
  }) {
    return RecentActivityState(
      recentActivityList: recentActivityList ?? this.recentActivityList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [recentActivityList, error, status];

  @override
  String toString() =>
      'RecentActivityState(recentActivityList: $recentActivityList, error: $error, status: $status)';
}
