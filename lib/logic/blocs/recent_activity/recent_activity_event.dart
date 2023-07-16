part of 'recent_activity_bloc.dart';

abstract class RecentActivityEvent extends Equatable {
  const RecentActivityEvent();

  @override
  List<Object> get props => [];
}

class LoadRecentActivityEvent extends RecentActivityEvent {
  final int uId;

  const LoadRecentActivityEvent({
    required this.uId,
  });

  @override
  List<Object> get props => [uId];
}
