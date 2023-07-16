part of 'training_offer_conversation_bloc.dart';

class TrainingOfferConversationState extends Equatable {
  final List<DBStatus> dbStatusList;
  final String error;
  final Status status;

  const TrainingOfferConversationState({
    this.dbStatusList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingOfferConversationState copyWith({
    List<DBStatus>? dbStatusList,
    String? error,
    Status? status,
  }) {
    return TrainingOfferConversationState(
      dbStatusList: dbStatusList ?? this.dbStatusList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [dbStatusList, error, status];

  @override
  String toString() =>
      'TrainingOfferConversationState(dbStatusList: $dbStatusList, error: $error, status: $status)';
}
