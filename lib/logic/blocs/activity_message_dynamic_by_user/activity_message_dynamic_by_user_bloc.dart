// import 'dart:async';

// import 'package:equatable/equatable.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/models/models_dynamics.dart';
// import 'package:my_project/repositories/all_repositories/all_repositories.dart';
// import 'package:my_project/repositories/repositories.dart';

// part 'activity_message_dynamic_by_user_event.dart';
// part 'activity_message_dynamic_by_user_state.dart';

// class ActivityMessageDynamicByUserBloc extends Bloc<
//     ActivityMessageDynamicByUserEvent, ActivityMessageDynamicByUserState> {
//   final Repositories _repositories = Repositories();
//   //
//   // final ActivityMessageDynamicByUserRepository
//   //     _activityMessageDynamicByUserRepository =
//   //     ActivityMessageDynamicByUserRepository();

//   ActivityMessageDynamicByUserBloc()
//       : super(const ActivityMessageDynamicByUserState(status: Status.initial)) {
//     on<LoadActivityMessageDynamicByUserEvent>(
//         _onLoadActivityMessageDynamicByUser);
//   }

//   FutureOr<void> _onLoadActivityMessageDynamicByUser(
//       event, Emitter<ActivityMessageDynamicByUserState> emit) async {
//     emit(const ActivityMessageDynamicByUserState(status: Status.loading));

//     try {
//       final activityMessageDynamicByUserListResponses =
//           await _repositories.getActivityMessageDynamicDataByUser(event.uId);
//       //
//       // await _activityMessageDynamicByUserRepository
//       //     .getActivityMessageDynamicByUserData(event.uId);
//       //
//       // if (kDebugMode) {
//       //   print(
//       //       'activityMessageDynamicByUserListResponses: $activityMessageDynamicByUserListResponses');
//       // }
//       emit(
//         state.copyWith(
//             status: Status.success,
//             activityMessageDynamicList:
//                 activityMessageDynamicByUserListResponses),
//       );
//     } catch (e) {
//       ActivityMessageDynamicByUserState(
//           status: Status.failure, error: e.toString());
//     }
//   }
// }
