import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/existence/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenAttendeeOnCreationBodyApproveAndDenyArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  // final AppTimeConstants _appTimeConstants = AppTimeConstants();
  // final AppNumberConstants _appNumberConstants = AppNumberConstants();

  final ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit;
  final double screenWidth;

  ChosenAttendeeOnCreationBodyApproveAndDenyArea({
    required this.chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppSizedBox(),
        _createApproveAndDenyArea(context),
        const CustomAppSizedBox(height: 18),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  CustomRow _createApproveAndDenyArea(BuildContext context) => CustomRow(
        mainAxisSize: MainAxisSize.max,
        children: [
          _displayDenyButton(context),
          _displayApproveButton(context),
        ],
      );

  /// DENY BUTTON ======================================================================================================
  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayDenyButton(BuildContext context) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.deny,
          elevatedButtonWidth: screenWidth * 0.35,
          buttonColor: _appColors.buttonDarkColor,
          onPressed: _checkWhetherUserRequestIsDenied()
              ? null
              : () {
                  _displayDenyDialog(context);
                });

  // DENY THE ATTENDEE ===============================================================================================
  // DISPLAY ===========================================================================================================
  void _displayDenyDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return DenyAttendeePopUp(
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit:
                  chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit);
          // _createDenyPopUp(context);
        });
  }

  // DENY POP UP =====================================================================================================
  // CREATE ===========================================================================================================
  // ActionPopUp _createDenyPopUp(BuildContext context) => ActionPopUp(
  //       titleContent: 'Deny the attendee?',
  //       action: 'Deny',
  //       actionVoidCallBack: () async {
  //         chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
  //                     .state
  //                     .chosenConsistedActivityDynamicWithDistanceList
  //                     .last
  //                     .processDetailDynamic
  //                     .processDetailId ==
  //                 1
  //             ? _sendDenyingRequestForChosenAttendee(context)
  //             : _sendDenyingRequestForChosenAttendeeWhichWasApprovedBefore(
  //                 context);
  //         _displayCompletingProcessAttendeeDialog(context);
  //       },
  //       cancelVoidCallBack: () {},
  //     );

  // APPROVE BUTTON ====================================================================================================
  // DISPLAY ===========================================================================================================
  CustomElevatedButton _displayApproveButton(BuildContext context) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.approve,
          elevatedButtonWidth: screenWidth * 0.35,
          buttonColor: _appColors.secondary,
          onPressed: _checkWhetherUserRequestIsApproved()
              ? null
              : () {
                  _displayApproveDialog(context);
                });

  // APPROVE THE ATTENDEE ==============================================================================================
  // DISPLAY ===========================================================================================================
  void _displayApproveDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ApproveAttendeePopUp(
              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit:
                  chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit);
          // _createApprovePopUp(context);
        });
  }

  // APPROVE POP UP ====================================================================================================
  // CREATE ===========================================================================================================
  // ActionPopUp _createApprovePopUp(BuildContext context) => ActionPopUp(
  //       titleContent: 'Approve the attendee?',
  //       action: 'Approve',
  //       actionVoidCallBack: () async {
  //         chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
  //                     .state
  //                     .chosenConsistedActivityDynamicWithDistanceList
  //                     .last
  //                     .processDetailDynamic
  //                     .processDetailId ==
  //                 1
  //             ? _sendApprovingRequestForChosenAttendee(context)
  //             : _sendApprovingRequestForChosenAttendeeWhichWasDeniedBefore(
  //                 context);
  //         _displayCompletingProcessAttendeeDialog(context);
  //       },
  //       cancelVoidCallBack: () {},
  //     );

  // DISPLAY ===========================================================================================================
  // Future<dynamic> _displayCompletingProcessAttendeeDialog(
  //         BuildContext context) =>
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (dialogContext) {
  //           return _listenAndBuildConsistedActivityBroughtFromDBAfterCompletingProceessAboutTheAttendee();
  //         });

  // CONSISTED ACTIVITY ================================================================================================
  // CONSUMER ==========================================================================================================
  // BlocConsumer<ConsistedActivityBloc, ConsistedActivityState>
  //     _listenAndBuildConsistedActivityBroughtFromDBAfterCompletingProceessAboutTheAttendee() =>
  //         BlocConsumer<ConsistedActivityBloc, ConsistedActivityState>(
  //           listenWhen: (previous, current) =>
  //               _checkWhetherConsistedActivityBroughtSuccessfully(current),
  //           listener: (context, state) {
  //             _recallConsistedActivityDynamicWithDistanceAttendedByUserBloc(
  //                 context);
  //             _initiateActivityConversationProcess(context);
  //           },
  //           builder: (context, state) {
  //             switch (state.status) {
  //               case Status.initial:
  //                 return DBProcessLoader();
  //               case Status.loading:
  //                 return DBProcessLoader();
  //               case Status.success:
  //                 return _listenAndBuildActivityConversationBroughtFromDBAfterCompletingProcessAboutConsistedActivity();
  //               case Status.failure:
  //                 return StateError(error: state.error);
  //             }
  //           },
  //         );

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  // _checkWhetherConsistedActivityBroughtSuccessfully(
  //         ConsistedActivityState current) =>
  //     current.status == Status.success;

  // ACTIVITY CONVERSATION BY CHOSEN ATTRIBUTES ========================================================================
  // CONSUMER ==========================================================================================================
  // BlocConsumer<ActivityConversationDynamicByChosenAttributesBloc,
  //         ActivityConversationDynamicByChosenAttributesState>
  //     _listenAndBuildActivityConversationBroughtFromDBAfterCompletingProcessAboutConsistedActivity() =>
  //         BlocConsumer<ActivityConversationDynamicByChosenAttributesBloc,
  //             ActivityConversationDynamicByChosenAttributesState>(
  //           listenWhen: (previous, current) => current.status == Status.success,
  //           listener: (context, activityState) {
  //             activityState.activityConversationDynamicList.isEmpty
  //                 ? _sendAddingRequestForActivityConversation(context)
  //                 : _sendUpdatingRequestForActivityConversation(
  //                     context, activityState);
  //           },
  //           builder: (context, activityState) {
  //             switch (activityState.status) {
  //               case Status.initial:
  //                 return const StateLoading();
  //               case Status.loading:
  //                 return const StateLoading();
  //               case Status.success:
  //                 return _listenAndBuildActivityConversationBroughtFromDB();
  //               case Status.failure:
  //                 return StateError(error: activityState.error);
  //             }
  //           },
  //         );

  // BlocConsumer<ActivityConversationDynamicByChosenAttributesBloc,
  //         ActivityConversationDynamicByChosenAttributesState>
  //     _listenAndBuildActivityConversationBroughtFromDB() => BlocConsumer<
  //             ActivityConversationDynamicByChosenAttributesBloc,
  //             ActivityConversationDynamicByChosenAttributesState>(
  //           listenWhen: (previous, current) => current.status == Status.success,
  //           listener: (context, state) {
  //             _recallActivityConversationDynamicByUserBloc(context);
  //             _recallMessageDynamicByGroupOfActivityConversationBloc(context);
  //           },
  //           builder: (context, state) {
  //             switch (state.status) {
  //               case Status.initial:
  //                 return const StateLoading();
  //               case Status.loading:
  //                 return const StateLoading();
  //               case Status.success:
  //                 return _initiateEndingProcess(context);
  //               case Status.failure:
  //                 return StateError(error: state.error);
  //             }
  //           },
  //         );

  // END METHODS =======================================================================================================
  // LoadSuccessfullyAlertDialog _initiateEndingProcess(BuildContext context) {
  //   _closeTheScreenWithDelaying(context);
  //   return _displayLoadSuccessfullyDialog();
  // }

  // DISPLAY ===========================================================================================================
  // LoadSuccessfullyAlertDialog _displayLoadSuccessfullyDialog() =>
  //     const LoadSuccessfullyAlertDialog(
  //         content:
  //             'The process which you chose has been completed without any mistake');

  /// GENERAL METHOD ===================================================================================================
  // Get Methods -------------------------------------------------------------------------------------------------------
  // int _getProcessDetailId(BuildContext context, String requestDetail) =>
  //     context
  //         .read<ProcessDetailDynamicBloc>()
  //         .state
  //         .processDetailDynamicList
  //         .indexWhere((element) => element.processName == requestDetail) +
  //     1;

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherUserRequestIsDenied() =>
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
          .state
          .chosenConsistedActivityDynamicWithDistanceList
          .last
          .processDetailDynamic
          .processName ==
      'Denied';

  bool _checkWhetherUserRequestIsApproved() =>
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
          .state
          .chosenConsistedActivityDynamicWithDistanceList
          .last
          .processDetailDynamic
          .processName ==
      'Approved';

  /// Find Methods -----------------------------------------------------------------------------------------------------
  // int? _findConsistedActivityId(BuildContext context) => context
  //     .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
  //     .state
  //     .chosenConsistedActivityDynamicWithDistanceList
  //     .last
  //     .consistedActivityId;

  // int _findCreatedActivityId(BuildContext context) => context
  //     .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
  //     .state
  //     .chosenConsistedActivityDynamicWithDistanceList
  //     .last
  //     .createdActivityDynamic
  //     .createdActivityId!;

  // int _findAttendeeId(BuildContext context) => context
  //     .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
  //     .state
  //     .chosenConsistedActivityDynamicWithDistanceList
  //     .last
  //     .attendee
  //     .uId!;

  // DateTime _findRequestedDate(BuildContext context) => context
  //     .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
  //     .state
  //     .chosenConsistedActivityDynamicWithDistanceList
  //     .last
  //     .requestDate;

  // DateTime? _findDeniedDate(BuildContext context) => context
  //     .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
  //     .state
  //     .chosenConsistedActivityDynamicWithDistanceList
  //     .last
  //     .deniedDate;

  // DateTime? _findApprovedDate(BuildContext context) => context
  //     .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
  //     .state
  //     .chosenConsistedActivityDynamicWithDistanceList
  //     .last
  //     .approvedDate;

  // DateTime _findDateTimeNow() => DateTime.now();

  // Datebase Methods --------------------------------------------------------------------------------------------------
  // void _sendDenyingRequestForChosenAttendee(BuildContext context) {
  //   context.read<ConsistedActivityBloc>().add(UpdateConsistedActivityEvent(
  //       consistedActivity: _denyConsistedActivity(context)));
  // }

  // void _sendDenyingRequestForChosenAttendeeWhichWasApprovedBefore(
  //     BuildContext context) {
  //   context.read<ConsistedActivityBloc>().add(UpdateConsistedActivityEvent(
  //       consistedActivity: _denyConsistedActivity(context)));
  // }

  // void _sendApprovingRequestForChosenAttendee(BuildContext context) {
  //   context.read<ConsistedActivityBloc>().add(UpdateConsistedActivityEvent(
  //       consistedActivity: _approveConsistedActivity(context)));
  // }

  // void _sendApprovingRequestForChosenAttendeeWhichWasDeniedBefore(
  //     BuildContext context) {
  //   context.read<ConsistedActivityBloc>().add(UpdateConsistedActivityEvent(
  //       consistedActivity: _approveConsistedActivity(context)));
  // }

  // void _initiateActivityConversationProcess(BuildContext context) {
  //   context.read<ActivityConversationDynamicByChosenAttributesBloc>().add(
  //       LoadActivityConversationDynamicByChosenAttributesEvent(
  //           consistedActivityId: _findConsistedActivityId(context)!));
  // }

  // void _sendAddingRequestForActivityConversation(BuildContext context) {
  //   context.read<ActivityConversationBloc>().add(AddActivityConversationEvent(
  //       activityConversation: _createActivityConversationInstance(context)));
  // }

  // void _sendUpdatingRequestForActivityConversation(
  //   BuildContext context,
  //   ActivityConversationDynamicByChosenAttributesState activityState,
  // ) {
  //   context.read<ActivityConversationBloc>().add(
  //       UpdateActivityConversationEvent(
  //           activityConversation: _updateActivityConversationMakeItActiveAgain(
  //               context, activityState)));
  // }

  // Recall Methods ----------------------------------------------------------------------------------------------------
  // void _recallConsistedActivityDynamicWithDistanceAttendedByUserBloc(
  //     BuildContext context) {
  //   context
  //       .read<
  //           ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc>()
  //       .add(
  //           CleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess());
  //   context
  //       .read<
  //           ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc>()
  //       .add(
  //           LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess(
  //               createdActivityId: _findCreatedActivityId(context), offset: 0));
  // }

  // void _recallActivityConversationDynamicByUserBloc(BuildContext context) {
  //   context
  //       .read<ActivityConversationDynamicByUserBloc>()
  //       .add(RecallActivityConversationDynamicByUserEvent());
  //   context.read<ActivityConversationDynamicByUserBloc>().add(
  //       LoadActivityConversationDynamicByUserEvent(
  //           uId: _appNumberConstants.appUserId));
  // }

  // void _recallMessageDynamicByGroupOfActivityConversationBloc(
  //     BuildContext context) {
  //   context
  //       .read<MessageDynamicByGroupOfActivityConversationBloc>()
  //       .add(RecallMessageDynamicByGroupOfActivityConversationEvent());
  //   context.read<MessageDynamicByGroupOfActivityConversationBloc>().add(
  //       LoadMessageDynamicByGroupOfActivityConversationEvent(
  //           uId: _appNumberConstants.appUserId));
  // }

  // Create Instance ---------------------------------------------------------------------------------------------------
  // ConsistedActivity _denyConsistedActivity(BuildContext context) {
  //   final ConsistedActivity consistedActivity = ConsistedActivity(
  //     consistedActivityId: _findConsistedActivityId(context),
  //     createdActivityId: _findCreatedActivityId(context),
  //     processDetailId: _getProcessDetailId(context, 'Denied'),
  //     attendeeId: _findAttendeeId(context),
  //     requestDate: _findRequestedDate(context),
  //     deniedDate: _findDateTimeNow(),
  //     updatedDate: _findDateTimeNow(),
  //     approvedDate: _findApprovedDate(context),
  //     isApproved: false,
  //     isActive: false,
  //   );
  //   return consistedActivity;
  // }

  // ConsistedActivity _approveConsistedActivity(BuildContext context) {
  //   final ConsistedActivity consistedActivity = ConsistedActivity(
  //     consistedActivityId: _findConsistedActivityId(context),
  //     createdActivityId: _findCreatedActivityId(context),
  //     processDetailId: _getProcessDetailId(context, 'Approved'),
  //     attendeeId: _findAttendeeId(context),
  //     requestDate: _findRequestedDate(context),
  //     approvedDate: _findDateTimeNow(),
  //     updatedDate: _findDateTimeNow(),
  //     deniedDate: _findDeniedDate(context),
  //     isApproved: true,
  //     isActive: true,
  //   );
  //   return consistedActivity;
  // }

  // ActivityConversation _createActivityConversationInstance(
  //     BuildContext context) {
  //   final ActivityConversation activityConversation = ActivityConversation(
  //     conversationTypeId: 1,
  //     consistedActivityId: _findConsistedActivityId(context)!,
  //     dateOfParticipation: _findDateTimeNow(),
  //   );
  //   return activityConversation;
  // }

  // ActivityConversation _updateActivityConversationMakeItActiveAgain(
  //   BuildContext context,
  //   ActivityConversationDynamicByChosenAttributesState activityState,
  // ) {
  //   final ActivityConversation activityConversation = ActivityConversation(
  //     activityConversationId:
  //         _findActivityConversationIdForUpdating(context, activityState),
  //     consistedActivityId:
  //         _findConsistedActivityIdForUpdating(context, activityState)!,
  //     conversationTypeId:
  //         _findConversationTypeIdForUpdating(context, activityState)!,
  //     dateOfParticipation:
  //         _findDateOfParticipationForUpdating(context, activityState),
  //     deactivatedAt: _findDeactivatedAtForUpdating(context, activityState),
  //     updatedAt: _findDateTimeNow(),
  //     isActive: true,
  //   );
  //   return activityConversation;
  // }

  // Iterable<ActivityConversationDynamic> _getChosenActivityConversation(
  //   BuildContext context,
  //   ActivityConversationDynamicByChosenAttributesState activityState,
  // ) =>
  //     activityState.activityConversationDynamicList.where((element) =>
  //         element.consistedActivityDynamic.consistedActivityId ==
  //         _chosenConsistedActivityId(context));

  // int? _chosenConsistedActivityId(BuildContext context) => context
  //     .read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>()
  //     .state
  //     .chosenConsistedActivityDynamicWithDistanceList
  //     .last
  //     .consistedActivityId;

  // int? _findActivityConversationIdForUpdating(
  //   BuildContext context,
  //   ActivityConversationDynamicByChosenAttributesState activityState,
  // ) =>
  //     _getChosenActivityConversation(context, activityState)
  //         .first
  //         .activityConversationId;

  // int? _findConsistedActivityIdForUpdating(
  //   BuildContext context,
  //   ActivityConversationDynamicByChosenAttributesState activityState,
  // ) =>
  //     _getChosenActivityConversation(context, activityState)
  //         .first
  //         .consistedActivityDynamic
  //         .consistedActivityId;

  // int? _findConversationTypeIdForUpdating(
  //   BuildContext context,
  //   ActivityConversationDynamicByChosenAttributesState activityState,
  // ) =>
  //     _getChosenActivityConversation(context, activityState)
  //         .first
  //         .conversationTypeDynamic
  //         .conversationTypeId;

  // DateTime _findDateOfParticipationForUpdating(
  //   BuildContext context,
  //   ActivityConversationDynamicByChosenAttributesState activityState,
  // ) =>
  //     _getChosenActivityConversation(context, activityState)
  //         .first
  //         .dateOfParticipation;

  // DateTime? _findDeactivatedAtForUpdating(
  //   BuildContext context,
  //   ActivityConversationDynamicByChosenAttributesState activityState,
  // ) =>
  //     _getChosenActivityConversation(context, activityState)
  //         .first
  //         .deactivatedAt;

  // Screen Methods ----------------------------------------------------------------------------------------------------
  // void _closeTheScreenWithDelaying(BuildContext context) {
  //   Future.delayed(_appTimeConstants.timeDuration, () {
  //     _closePopUp(context);
  //   });
  // }

  // void _closePopUp(BuildContext context) {
  //   int pageCount = 0;
  //   Navigator.of(context).popUntil((_) => pageCount++ >= 3);
  // }
}
