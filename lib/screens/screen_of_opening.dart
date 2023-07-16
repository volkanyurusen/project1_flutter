import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfOpening extends StatefulWidget {
  static const String routeName = 'screen_of_opening';
  const ScreenOfOpening({Key? key}) : super(key: key);

  @override
  State<ScreenOfOpening> createState() => _ScreenOfOpeningState();
}

class _ScreenOfOpeningState extends State<ScreenOfOpening> {
  final appUserId = AppNumberConstants().appUserId;
  final appCoachId = AppNumberConstants().appCoachId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _redirection(context));
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0);
    return Scaffold(
      body: Stack(
        children: [
          _createScreenSizedBox(backgroundColor),
          _createInformationText(),
        ],
      ),
    );
  }

  /// CREATE ==========================================================================================================
  ScreenSizedBox _createScreenSizedBox(
    Color backgroundColor,
  ) =>
      ScreenSizedBox(child: _displayScreenStack(backgroundColor));

  Column _createInformationText() => Column(
        children: [
          SizedBox(height: context.height / 1.8),
          Center(child: _displayInformationText()),
        ],
      );

  AppHeaderText _displayInformationText() => AppHeaderText(
      textLabel: 'You are being redirected to the home page',
      textStyle: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: AppColors().scaffoldBackgroundColor));

  /// DISPLAY ==========================================================================================================
  CustomScreenStack _displayScreenStack(
    Color backgroundColor,
  ) =>
      CustomScreenStack(
          assetImage: _assetImage,
          imageFilterBlurSigmaX: 1.8,
          imageFilterBlurSigmaY: 1.8,
          color: backgroundColor);

  /// METHODS ==========================================================================================================
  String get _assetImage =>
      'assets/images/home_screens/home-screen-${Random().nextInt(10)}.jpg';

  /// METHODS ==========================================================================================================
  Future<void> _redirection(BuildContext context) async {
    _bringLocationDetailDynamicByChosenAttributes(context);
    _bringCreatedActivityDynamicByHost(context);
    _bringResultOfPreferedActivityDynamic(context);
    _bringAttendedActivityByAttendee(context);
    _bringCreatedActivityDynamicWithDistanceCreatedByUser(context);
    _bringConsistedActivityDynamicWithDistanceAttendedByUser(context);
    _bringActivityTemplatesFromDatabase(context, appUserId);
    _bringLocationTemplatesFromDatabase(context, appUserId);
    _bringTrainingRequestDynamicRequestedByUser(context, appUserId);
    _bringTrainingOfferDynamicOfferedByCoach(context, appCoachId);
    _bringActivityConversationDynamicByUser(context, appUserId);
    _bringMessageDynamicByGroupOfActivityConversation(context, appUserId);
    _bringTrainingRequestConversationDynamicByUserBloc(context, appUserId);
    _bringTrainingRequestConversationDynamicByUserBloc(context, appUserId);
    _bringTrainingOfferResponseDynamicRespondedByTraineeBloc(
        context, appUserId);
    _bringFindACoachConversationDynamicByTraineeBloc(context, appUserId);
    _bringActivityTypeDynamicBloc(context);
    _bringActivityNameDynamicBloc(context);
    _bringProcessDetailDynamicBloc(context);
    _bringGenderDetailDynamicBloc(context);
    _bringUserDynamic(context, appUserId);
    _bringMembershipTypeDynamic(context);
    if (appCoachId != 0) {
      _bringTrainingOfferConversationDynamicByUserBloc(context, appUserId);
      _bringCoachDynamic(context, appCoachId);
      _bringCoachingTypeDynamic(context);
    }
    _goToHomeScreen(context);
  }

  void _bringLocationDetailDynamicByChosenAttributes(BuildContext context) {
    context.read<LocationDetailDynamicByChosenAttributesBloc>().add(
        const LoadLocationDetailDynamicByChosenAttributesEvent(
            prefferedLocationCircularDiameter: 50.00,
            membershipMaxDiameter: 50.00,
            lat: 50.000,
            lon: 8.000));
  }

  void _bringCreatedActivityDynamicByHost(BuildContext context) {
    context
        .read<CreatedActivityDynamicByHostBloc>()
        .add(LoadCreatedActivityDynamicByHostEvent(hostId: appUserId));
  }

  void _bringResultOfPreferedActivityDynamic(BuildContext context) {
    BlocProvider.of<ResultOfPreferredActivityDynamicBloc>(context).add(
        LoadResultOfPreferredActivityDynamic(
            uId: appUserId,
            activityTitle: 'Field_Hockey',
            locationCircularDiamter: 50.00,
            lat: 50.000,
            lon: 8.000));
  }

  void _bringAttendedActivityByAttendee(BuildContext context) {
    context
        .read<AttendedActivityByAttendeeBloc>()
        .add(LoadAttendedActivityByAttendeeEvent(attendeeId: appUserId));
  }

  void _bringCreatedActivityDynamicWithDistanceCreatedByUser(
      BuildContext context) {
    context.read<CreatedActivityDynamicWithDistanceCreatedByUserBloc>().add(
        LoadCreatedActivityDynamicWithDistanceCreatedByUserEvent(
            uId: appUserId));
  }

  void _bringConsistedActivityDynamicWithDistanceAttendedByUser(
      BuildContext context) {
    context.read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>().add(
        LoadConsistedActivityDynamicWithDistanceAttendedByUserEvent(
            uId: appUserId));
  }

  void _bringActivityTemplatesFromDatabase(
      BuildContext context, int appUserId) {
    BlocProvider.of<ActivityTemplateDynamicByUserBloc>(context)
        .add(LoadActivityTemplateDynamicByUserEvent(uId: appUserId));
  }

  void _bringLocationTemplatesFromDatabase(
      BuildContext context, int appUserId) {
    BlocProvider.of<LocationTemplateDynamicByUserBloc>(context)
        .add(LoadLocationTemplateDynamicByUserEvent(uId: appUserId));
  }

  void _bringTrainingRequestDynamicRequestedByUser(
      BuildContext context, int appUserId) {
    BlocProvider.of<TrainingRequestDynamicRequestedByUserBloc>(context)
        .add(LoadTrainingRequestDynamicRequestedByUserEvent(uId: appUserId));
  }

  void _bringTrainingOfferDynamicOfferedByCoach(
      BuildContext context, int appUserId) {
    BlocProvider.of<TrainingOfferDynamicOfferedByCoachBloc>(context)
        .add(LoadTrainingOfferDynamicOfferedByCoachEvent(coachId: appCoachId));
  }

  void _bringActivityConversationDynamicByUser(
      BuildContext context, int appUserId) {
    BlocProvider.of<ActivityConversationDynamicByUserBloc>(context)
        .add(LoadActivityConversationDynamicByUserEvent(uId: appUserId));
  }

  void _bringMessageDynamicByGroupOfActivityConversation(
      BuildContext context, int appUserId) {
    BlocProvider.of<MessageDynamicByGroupOfActivityConversationBloc>(context)
        .add(LoadMessageDynamicByGroupOfActivityConversationEvent(
            uId: appUserId));
  }

  void _bringTrainingRequestConversationDynamicByUserBloc(
      BuildContext context, int appUserId) {
    BlocProvider.of<TrainingRequestConversationDynamicByUserBloc>(context)
        .add(LoadTrainingRequestConversationDynamicByUserEvent(uId: appUserId));
  }

  void _bringTrainingOfferResponseDynamicRespondedByTraineeBloc(
      BuildContext context, int appUserId) {
    BlocProvider.of<TrainingOfferResponseDynamicRespondedByTraineeBloc>(context)
        .add(LoadTrainingOfferResponseDynamicRespondedByTraineeEvent(
            traineeId: appUserId));
  }

  void _bringFindACoachConversationDynamicByTraineeBloc(
      BuildContext context, int appUserId) {
    BlocProvider.of<FindACoachConversationDynamicByTraineeBloc>(context).add(
        LoadFindACoachConversationDynamicByTraineeEvent(traineeId: appUserId));
  }

  void _bringActivityTypeDynamicBloc(BuildContext context) {
    BlocProvider.of<ActivityTypeDynamicBloc>(context)
        .add(LoadActivityTypeDynamicEvent());
  }

  void _bringActivityNameDynamicBloc(BuildContext context) {
    BlocProvider.of<ActivityNameDynamicBloc>(context)
        .add(LoadActivityNameDynamicEvent());
  }

  void _bringProcessDetailDynamicBloc(BuildContext context) {
    BlocProvider.of<ProcessDetailDynamicBloc>(context)
        .add(LoadProcessDetailDynamicEvent());
  }

  void _bringGenderDetailDynamicBloc(BuildContext context) {
    BlocProvider.of<GenderDynamicBloc>(context).add(LoadGenderDynamicEvent());
  }

  void _bringUserDynamic(BuildContext context, int appUserId) {
    BlocProvider.of<UserDynamicBloc>(context)
        .add(LoadUserDynamicEvent(uId: appUserId));
  }

  void _bringMembershipTypeDynamic(BuildContext context) {
    BlocProvider.of<MembershipTypeBloc>(context).add(LoadMembershipTypeEvent());
  }

  void _bringTrainingOfferConversationDynamicByUserBloc(
      BuildContext context, int appUserId) {
    BlocProvider.of<TrainingOfferConversationDynamicByUserBloc>(context)
        .add(LoadTrainingOfferConversationDynamicByUserEvent(uId: appUserId));
  }

  void _bringCoachDynamic(BuildContext context, int appCoachId) {
    BlocProvider.of<CoachDynamicBloc>(context)
        .add(LoadCoachDynamicEvent(coachId: appCoachId));
  }

  void _bringCoachingTypeDynamic(BuildContext context) {
    BlocProvider.of<CoachingTypeBloc>(context).add(LoadCoachingTypeEvent());
  }

  void _goToHomeScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushNamed(context, ScreenOfHome.routeName);
    });
  }
}
