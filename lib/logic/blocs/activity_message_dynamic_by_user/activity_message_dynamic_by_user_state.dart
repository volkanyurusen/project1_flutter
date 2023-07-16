// part of 'activity_message_dynamic_by_user_bloc.dart';

// class ActivityMessageDynamicByUserState extends Equatable {
//   final List<MessageDynamic> activityMessageDynamicList;
//   final String error;
//   final Status status;

//   const ActivityMessageDynamicByUserState({
//     this.activityMessageDynamicList = const [],
//     this.error = '',
//     this.status = Status.initial,
//   });

//   ActivityMessageDynamicByUserState copyWith({
//     List<MessageDynamic>? activityMessageDynamicList,
//     String? error,
//     Status? status,
//   }) {
//     return ActivityMessageDynamicByUserState(
//       activityMessageDynamicList: activityMessageDynamicList ??
//           this.activityMessageDynamicList,
//       error: error ?? this.error,
//       status: status ?? this.status,
//     );
//   }

//   @override
//   List<Object?> get props => [activityMessageDynamicList, error, status];

//   @override
//   String toString() =>
//       'ActivityMessageDynamicByUserState(cActivityMessageDynamicList: $activityMessageDynamicList, error: $error, status: $status)';
// }
