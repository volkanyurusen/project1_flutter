part of 'training_offer_response_bloc.dart';

class TrainingOfferResponseState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const TrainingOfferResponseState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingOfferResponseState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return TrainingOfferResponseState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'TrainingOfferResponseState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
