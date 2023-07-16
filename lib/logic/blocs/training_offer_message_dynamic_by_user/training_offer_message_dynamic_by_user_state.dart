// part of 'training_offer_message_dynamic_by_user_bloc.dart';

// class TrainingOfferMessageDynamicByUserState extends Equatable {
//   final List<TrainingOfferMessageDynamic> trainingOfferMessageDynamicList;
//   final String error;
//   final Status status;

//   const TrainingOfferMessageDynamicByUserState({
//     this.trainingOfferMessageDynamicList = const [],
//     this.error = '',
//     this.status = Status.initial,
//   });

//   TrainingOfferMessageDynamicByUserState copyWith({
//     List<TrainingOfferMessageDynamic>? trainingOfferMessageDynamicList,
//     String? error,
//     Status? status,
//   }) {
//     return TrainingOfferMessageDynamicByUserState(
//       trainingOfferMessageDynamicList:
//           trainingOfferMessageDynamicList ??
//               this.trainingOfferMessageDynamicList,
//       error: error ?? this.error,
//       status: status ?? this.status,
//     );
//   }

//   @override
//   List<Object?> get props =>
//       [trainingOfferMessageDynamicList, error, status];

//   @override
//   String toString() =>
//       'TrainingOfferMessageDynamicByUserState(trainingOfferMessageDynamicList: $trainingOfferMessageDynamicList, error: $error, status: $status)';
// }
