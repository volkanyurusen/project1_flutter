part of 'training_offer_bloc.dart';

class TrainingOfferState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const TrainingOfferState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingOfferState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return TrainingOfferState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'TrainingOfferState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
