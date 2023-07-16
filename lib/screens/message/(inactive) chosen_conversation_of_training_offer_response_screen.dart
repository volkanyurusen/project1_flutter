// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/logic/cubits/cubits.dart';
// import 'package:my_project/screens/message/bodies/zbodies.dart';

// import 'local_widgets/zlocal_widget.dart';
// import 'zscreens.dart';

// class ChosenConversationOfTrainingOfferResponseScreen extends StatelessWidget {
//   static const String routeName =
//       'chosen_conversation_of_training_offer_response_screen';
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppDateFormat _appDateFormat = AppDateFormat();

//   ChosenConversationOfTrainingOfferResponseScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc
//         bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc =
//         context.read<
//             BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc>();
//     final ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit =
//         context.read<
//             ChosenTrainingOfferConversationDynamicByIndividualUserCubit>();
//     final ChosenTrainingOfferMessageDynamicByIndividualUserCubit
//         chosenTrainingOfferMessageDynamicByIndividualUserCubit =
//         context.read<ChosenTrainingOfferMessageDynamicByIndividualUserCubit>();

//     return WillPopScope(
//       onWillPop: () {
//         _unchooseChosenTrainingOfferConversation(
//             chosenTrainingOfferConversationDynamicByIndividualUserCubit);
//         _unchooseMessagesOfChosenTrainingOfferConversationIfExist(
//             chosenTrainingOfferMessageDynamicByIndividualUserCubit);
//         _closeTheScreen(context);
//         return Future(() => true);
//       },
//       child: Scaffold(
//         appBar: _displayConversationAppBar(
//             context,
//             bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc,
//             chosenTrainingOfferConversationDynamicByIndividualUserCubit),
//         body: const ChosenConversationOfTrainingOfferResponseBody(),
//       ),
//     );
//   }

//   /// DISPLAY ==========================================================================================================
//   ConversationAppBar _displayConversationAppBar(
//     BuildContext context,
//     BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc
//         bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc,
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//   ) =>
//       ConversationAppBar(
//           onTap: () =>
//               _goToChosenTrainingOfferDetailScreenWhileBringingNecessaryBloc(
//                   context,
//                   bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc,
//                   chosenTrainingOfferConversationDynamicByIndividualUserCubit),
//           imageWidget: _displayActivityImage(
//               chosenTrainingOfferConversationDynamicByIndividualUserCubit),
//           activityTitle: _displayActivityTitle(
//               chosenTrainingOfferConversationDynamicByIndividualUserCubit),
//           date: _displayCreatedDate(
//               chosenTrainingOfferConversationDynamicByIndividualUserCubit));

//   AssetImage _displayActivityImage(
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//   ) =>
//       _findImageUrl(
//           chosenTrainingOfferConversationDynamicByIndividualUserCubit);

//   String _displayActivityTitle(
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//   ) =>
//       _appFunctions.setWithoutUnderscore(_findActivityTitle(
//           chosenTrainingOfferConversationDynamicByIndividualUserCubit));

//   String _displayCreatedDate(
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//   ) =>
//       _appDateFormat.monthAndDayWithDayName.format(_findCreatedDate(
//           chosenTrainingOfferConversationDynamicByIndividualUserCubit));

//   /// METHODS ==========================================================================================================
//   void _goToChosenTrainingOfferDetailScreenWhileBringingNecessaryBloc(
//     BuildContext context,
//     BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc
//         bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc,
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//   ) {
//     _bringConsistedActivityDynamicsWithDistance(
//         bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc,
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit);
//     // _goToChosenTrainingOfferDetailScreen(context);
//   }

//   void _bringConsistedActivityDynamicsWithDistance(
//     BringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc
//         bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc,
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//   ) =>
//       bringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferBloc.add(
//           LoadBringTrainingOfferResponseDynamicWithDistanceByIndividualTrainingOfferEvent(
//               trainingOfferId:
//                   chosenTrainingOfferConversationDynamicByIndividualUserCubit
//                       .state
//                       .chosenTrainingOfferConversationDynamicByIndividualUser
//                       .first
//                       .trainingOfferResponseDynamic
//                       .trainingOfferDynamic
//                       .trainingOfferId!));

//   /// Find Methods -----------------------------------------------------------------------------------------------------
//   AssetImage _findImageUrl(
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//   ) =>
//       AssetImage(
//           'assets/images/activities/${chosenTrainingOfferConversationDynamicByIndividualUserCubit.state.chosenTrainingOfferConversationDynamicByIndividualUser.first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

//   String _findActivityTitle(
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//   ) =>
//       chosenTrainingOfferConversationDynamicByIndividualUserCubit
//           .state
//           .chosenTrainingOfferConversationDynamicByIndividualUser
//           .first
//           .trainingOfferResponseDynamic
//           .trainingOfferDynamic
//           .trainingDetailDynamic
//           .activityNameDynamic
//           .activityTitle;

//   DateTime _findCreatedDate(
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//   ) =>
//       chosenTrainingOfferConversationDynamicByIndividualUserCubit
//           .state
//           .chosenTrainingOfferConversationDynamicByIndividualUser
//           .first
//           .trainingOfferResponseDynamic
//           .trainingOfferDynamic
//           .createdAt;

//   /// Unchoose Methods -------------------------------------------------------------------------------------------------
//   void _unchooseChosenTrainingOfferConversation(
//     ChosenTrainingOfferConversationDynamicByIndividualUserCubit
//         chosenTrainingOfferConversationDynamicByIndividualUserCubit,
//   ) {
//     if (chosenTrainingOfferConversationDynamicByIndividualUserCubit.state
//         .chosenTrainingOfferConversationDynamicByIndividualUser.isNotEmpty) {
//       chosenTrainingOfferConversationDynamicByIndividualUserCubit
//           .pressCancelButton(
//               chosenTrainingOfferConversationDynamicByIndividualUserCubit
//                   .state
//                   .chosenTrainingOfferConversationDynamicByIndividualUser
//                   .first);
//     }
//   }

//   void _unchooseMessagesOfChosenTrainingOfferConversationIfExist(
//       ChosenTrainingOfferMessageDynamicByIndividualUserCubit
//           chosenTrainingOfferMessageDynamicByIndividualUserCubit) {
//     if (chosenTrainingOfferMessageDynamicByIndividualUserCubit
//         .state.chosenTrainingOfferMessageDynamicByIndividualUser.isNotEmpty) {
//       chosenTrainingOfferMessageDynamicByIndividualUserCubit.pressCancelButton(
//           chosenTrainingOfferMessageDynamicByIndividualUserCubit
//               .state.chosenTrainingOfferMessageDynamicByIndividualUser);
//     }
//   }

//   /// Screen Method ----------------------------------------------------------------------------------------------------
//   // void _goToChosenTrainingOfferDetailScreen(
//   //   BuildContext context,
//   // ) =>
//   //     Navigator.of(context)
//   //         .pushNamed(ChosenTrainingOfferDetailScreen.routeName);

//   void _closeTheScreen(BuildContext context) => Navigator.of(context).pop();
// }
