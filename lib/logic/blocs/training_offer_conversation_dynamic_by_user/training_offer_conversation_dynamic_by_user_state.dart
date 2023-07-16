part of 'training_offer_conversation_dynamic_by_user_bloc.dart';

class TrainingOfferConversationDynamicByUserState extends Equatable {
  final List<TrainingOfferConversationDynamic>
      trainingOfferConversationDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingOfferConversationDynamicByUserState({
    this.trainingOfferConversationDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingOfferConversationDynamicByUserState copyWith({
    List<TrainingOfferConversationDynamic>?
        trainingOfferConversationDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingOfferConversationDynamicByUserState(
      trainingOfferConversationDynamicList:
          trainingOfferConversationDynamicList ??
              this.trainingOfferConversationDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [trainingOfferConversationDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'TrainingOfferConversationDynamicByUserState(trainingOfferConversationDynamicList: $trainingOfferConversationDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
