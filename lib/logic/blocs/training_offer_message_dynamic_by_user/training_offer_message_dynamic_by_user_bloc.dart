// import 'dart:async';

// import 'package:equatable/equatable.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/models/models_dynamics.dart';
// import 'package:my_project/repositories/repositories.dart';

// part 'training_offer_message_dynamic_by_user_event.dart';
// part 'training_offer_message_dynamic_by_user_state.dart';

// class TrainingOfferMessageDynamicByUserBloc extends Bloc<
//     TrainingOfferMessageDynamicByUserEvent,
//     TrainingOfferMessageDynamicByUserState> {
//   final Repositories _repositories = Repositories();

//   TrainingOfferMessageDynamicByUserBloc()
//       : super(const TrainingOfferMessageDynamicByUserState(
//             status: Status.initial)) {
//     on<LoadTrainingOfferMessageDynamicByUserEvent>(
//         _onLoadTrainingOfferMessageDynamicByUser);
//   }

//   FutureOr<void> _onLoadTrainingOfferMessageDynamicByUser(
//       event, Emitter<TrainingOfferMessageDynamicByUserState> emit) async {
//     emit(const TrainingOfferMessageDynamicByUserState(status: Status.loading));

//     try {
//       final trainingOfferMessageDynamicByUserListResponses = await _repositories
//           .getTrainingOfferMessageDynamicDataByUser(event.uId);
//       //
//       // if (kDebugMode) {
//       //   print(
//       //       'trainingOfferMessageDynamicByUserListResponses: $trainingOfferMessageDynamicByUserListResponses');
//       // }
//       emit(
//         state.copyWith(
//             status: Status.success,
//             trainingOfferMessageDynamicList:
//                 trainingOfferMessageDynamicByUserListResponses),
//       );
//     } catch (e) {
//       TrainingOfferMessageDynamicByUserState(
//           status: Status.failure, error: e.toString());
//     }
//   }
// }
