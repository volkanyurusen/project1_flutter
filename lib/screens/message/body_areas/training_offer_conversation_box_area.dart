// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/models/models_dynamics.dart';
// import 'package:my_project/widgets/widget.dart';

// import '../local_widgets/zlocal_widget.dart';

// class TrainingOfferConversationBox extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppDateFormat _appDateFormat = AppDateFormat();
//   final TrainingOfferConversationDynamicByUserState conversationState;
//   final Set<int?> uniqueSetOfTrainingOfferId;
//   final double screenWidth;
//   final int index;

//   TrainingOfferConversationBox({
//     required this.conversationState,
//     required this.uniqueSetOfTrainingOfferId,
//     required this.screenWidth,
//     required this.index,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double boxHeight = 70;
//     double imageBoxHeight = boxHeight;
//     double imageBoxWidth = boxHeight;
//     final TextStyle headlineSmall = Theme.of(context).textTheme.headlineSmall!;
//     final TextStyle bodyLarge = Theme.of(context).textTheme.bodyLarge!;
//     final Color pastTrainingOfferColor = _appColors.textColor;

//     return SizedBox(
//       height: boxHeight,
//       width: screenWidth,
//       child: _createTrainingOfferConversationBoxArea(context, imageBoxHeight,
//           imageBoxWidth, headlineSmall, bodyLarge, pastTrainingOfferColor),
//     );
//   }

//   /// CREATE ===========================================================================================================
//   ConversationBox _createTrainingOfferConversationBoxArea(
//     BuildContext context,
//     double imageBoxHeight,
//     double imageBoxWidth,
//     TextStyle headlineSmall,
//     TextStyle bodyLarge,
//     Color pastTrainingOfferColor,
//   ) =>
//       ConversationBox(
//         imageWidget: _displayActivityImage(),
//         textOf: _displayActivityTitleText(),
//         textOfDate: _displayDate(),
//         textOfDateDetail: _displayDayDifferences(),
//         isActivityCreatedByAppUser: checkWhetherTheActivityIsCreatedByAppUser(),
//         isActivityNotPassed: _checkDateInFuture(conversationState, index),
//         pastActivityColor: pastTrainingOfferColor,
//         widget:
//             _buildAndDisplayTheLastMessageOfTheRelevantActvitiyConversationArea(
//           bodyLarge,
//           pastTrainingOfferColor,
//         ),
//       );

//   /// SKELTON ==========================================================================================================
//   SkeltonContainer _createSkeltonContainer() =>
//       SkeltonContainer(height: 14, width: 180);

//   /// BUILD ============================================================================================================
//   BlocBuilder<TrainingOfferMessageDynamicByUserBloc,
//           TrainingOfferMessageDynamicByUserState>
//       _buildAndDisplayTheLastMessageOfTheRelevantActvitiyConversationArea(
//     TextStyle bodyLarge,
//     Color pastTrainingOfferColor,
//   ) =>
//           BlocBuilder<TrainingOfferMessageDynamicByUserBloc,
//               TrainingOfferMessageDynamicByUserState>(
//             builder: (context, messageState) {
//               List<TrainingOfferMessageDynamic>
//                   messageListByUniqueCreatedActivity = [];
//               addTheMessagesInMessageListByUniqueCreatedActivity(
//                   messageState, messageListByUniqueCreatedActivity);
//               switch (messageState.status) {
//                 case Status.initial:
//                   return _createSkeltonContainer();
//                 case Status.loading:
//                   return _createSkeltonContainer();
//                 case Status.success:
//                   return _displayTheLastMessage(
//                       context,
//                       messageListByUniqueCreatedActivity,
//                       bodyLarge,
//                       pastTrainingOfferColor);
//                 case Status.failure:
//                   return StateError(error: messageState.error);
//               }
//             },
//           );

//   /// DISPLAY ==========================================================================================================
//   AssetImage _displayActivityImage() => _findActivityImage();

//   String _displayActivityTitleText() =>
//       _appFunctions.setWithoutUnderscore(_findActivityTitle());

//   String _displayDate() =>
//       _appDateFormat.monthAndDayWithDayName.format(_findDate());

//   String _displayDayDifferences() =>
//       _appFunctions.showDayDifference(_findDate());

//   AppHeaderText _displayTheLastMessage(
//     BuildContext context,
//     List<TrainingOfferMessageDynamic> messageListByUniqueCreatedActivity,
//     TextStyle bodyLarge,
//     Color pastTrainingOfferColor,
//   ) =>
//       AppHeaderText(
//           textLabel: _displayMessageText(messageListByUniqueCreatedActivity),
//           textStyle: _determineTextStyle(
//               _checkDateInFuture(conversationState, index),
//               bodyLarge,
//               pastTrainingOfferColor));

//   String _displayMessageText(
//     List<TrainingOfferMessageDynamic> messageListByUniqueCreatedActivity,
//   ) =>
//       messageListByUniqueCreatedActivity.isEmpty
//           ? ''
//           : _displayMessageTextWithMax30Character(
//               messageListByUniqueCreatedActivity);

//   String _displayMessageTextWithMax30Character(
//           List<TrainingOfferMessageDynamic>
//               messageListByUniqueCreatedActivity) =>
//       _findLastMessageLenght(messageListByUniqueCreatedActivity) > 30
//           ? '${messageListByUniqueCreatedActivity.last.message.substring(0, 30)}...'
//           : messageListByUniqueCreatedActivity.last.message.substring(
//               0, _findLastMessageLenght(messageListByUniqueCreatedActivity));

//   /// METHODS ==========================================================================================================
//   void addTheMessagesInMessageListByUniqueCreatedActivity(
//     TrainingOfferMessageDynamicByUserState messageState,
//     List<TrainingOfferMessageDynamic> messageListByUniqueCreatedActivity,
//   ) {
//     for (var element in messageState.trainingOfferMessageDynamicList) {
//       if (element.trainingOfferConversationDynamic.trainingOfferResponseDynamic
//               .trainingOfferDynamic.trainingOfferId ==
//           uniqueSetOfTrainingOfferId.elementAt(index)) {
//         messageListByUniqueCreatedActivity.add(element);
//       }
//     }
//   }

//   /// Find Methods -----------------------------------------------------------------------------------------------------
//   String _findActivityTitle() =>
//       '${_checkAndFindUniqueActivity().first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle} ${_checkAndFindUniqueActivity().first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingOfferId}';

//   int _findLastMessageLenght(
//           List<TrainingOfferMessageDynamic>
//               messageListByUniqueCreatedActivity) =>
//       messageListByUniqueCreatedActivity.last.message.length;

//   DateTime _findDate() => _checkAndFindUniqueActivity()
//       .first
//       .trainingOfferResponseDynamic
//       .trainingOfferDynamic
//       .createdAt;

//   AssetImage _findActivityImage() => AssetImage(
//       'assets/images/activities/${_checkAndFindUniqueActivity().first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

//   /// Check Methods ----------------------------------------------------------------------------------------------------
//   Iterable<TrainingOfferConversationDynamic> _checkAndFindUniqueActivity() =>
//       conversationState.trainingOfferConversationDynamicList.where((element) =>
//           element.trainingOfferResponseDynamic.trainingOfferDynamic
//               .trainingOfferId ==
//           uniqueSetOfTrainingOfferId.elementAt(index));

//   bool checkWhetherTheActivityIsCreatedByAppUser() =>
//       _checkAndFindUniqueActivity()
//           .first
//           .trainingOfferResponseDynamic
//           .trainingOfferDynamic
//           .coachDynamic
//           .userDynamic
//           .uId ==
//       AppNumberConstants().appUserId;

//   bool _checkDateInFuture(
//     TrainingOfferConversationDynamicByUserState conversationState,
//     int index,
//   ) =>
//       _checkAndFindUniqueActivity()
//           .first
//           .trainingOfferResponseDynamic
//           .trainingOfferDynamic
//           .createdAt
//           .isAfter(DateTime.now());

//   /// Other Methods ----------------------------------------------------------------------------------------------------
//   TextStyle _determineTextStyle(
//     bool checkMethod,
//     TextStyle textStyle,
//     Color pastTrainingOfferColor,
//   ) =>
//       checkMethod
//           ? textStyle
//           : textStyle.copyWith(color: pastTrainingOfferColor);
// }
