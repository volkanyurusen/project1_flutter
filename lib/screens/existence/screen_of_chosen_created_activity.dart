// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/created_activity_dynamic_with_distance.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/screens/existence/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfChosenCreatedActivity extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_created_activity';

  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();

  ScreenOfChosenCreatedActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () async {
          _unchooseChosenActivity(context);
          return Future(() => true);
        },
        child: Scaffold(
            appBar: _createActivityPictureOnTop(context),
            bottomNavigationBar: const CustomBottomNavigationBar(),
            body: ChosenCreatedActivityBody(screenWidth: screenWidth)));
  }

  // APP BAR ===========================================================================================================
  // CREATE ============================================================================================================
  PreferredSizeForPicture _createActivityPictureOnTop(BuildContext context) =>
      PreferredSizeForPicture(
          context: context,
          child: AppBar(
            flexibleSpace: _buildChosenActivityPhoto(),
            actions: [_buildCancelIcon()],
          ));

  /// CHOSEN ACTIVITY PICTURE ON TOP ===================================================================================
  // BLOC ==============================================================================================================
  BlocBuilder<ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
          ChosenActivityAmongCreatedActivityDynamicCreatedByUserState>
      _buildChosenActivityPhoto() => BlocBuilder<
              ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
              ChosenActivityAmongCreatedActivityDynamicCreatedByUserState>(
          builder: (context, state) => AppBarHero(
              tag: _heroTag(state), image: _displayChoiceActivityImage(state)));

  // DISPLAY ===========================================================================================================
  AssetImage _displayChoiceActivityImage(
          ChosenActivityAmongCreatedActivityDynamicCreatedByUserState state) =>
      AssetImage(_findActivityPhotoFromAssets(state));

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findActivityPhotoFromAssets(
          ChosenActivityAmongCreatedActivityDynamicCreatedByUserState state) =>
      'assets/images/activities/${_findActivityTitle(state).toLowerCase()}.jpg';

  String _findActivityTitle(
          ChosenActivityAmongCreatedActivityDynamicCreatedByUserState state) =>
      state.chosenCreatedActivityDynamicWithDistanceList.last
          .activityNameDynamic.activityTitle;

  // Hero Methods ------------------------------------------------------------------------------------------------------
  String _heroTag(
          ChosenActivityAmongCreatedActivityDynamicCreatedByUserState state) =>
      '${state.chosenCreatedActivityDynamicWithDistanceList.last.host.username}+${state.chosenCreatedActivityDynamicWithDistanceList.last.createdActivityId}';

  /// LEAVE FROM ACTIVITY ICON =========================================================================================
  // BLOC ==============================================================================================================
  BlocBuilder<ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
          ChosenActivityAmongCreatedActivityDynamicCreatedByUserState>
      _buildCancelIcon() => BlocBuilder<
              ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
              ChosenActivityAmongCreatedActivityDynamicCreatedByUserState>(
          builder: (context, state) => _createIconButtonArea(context, state));

  // CREATE ============================================================================================================
  IconButton _createIconButtonArea(
    BuildContext context,
    ChosenActivityAmongCreatedActivityDynamicCreatedByUserState state,
  ) =>
      IconButton(
          splashRadius: 18,
          icon: _displayIcon(),
          onPressed: () {
            _openCancelTheActivityPopUp(context, state);
          });

  // DISPLAY ===========================================================================================================
  Icon _displayIcon() => const Icon(Icons.clear_outlined);

  // METHODS ===========================================================================================================
  void _openCancelTheActivityPopUp(
    BuildContext context,
    ChosenActivityAmongCreatedActivityDynamicCreatedByUserState state,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _createLeavePopUp(context);
          });

  // LEAVE POP UP ======================================================================================================
  // METHODS ===========================================================================================================
  ActionPopUp _createLeavePopUp(BuildContext context) => ActionPopUp(
        action: 'Leave',
        titleContent: 'Leave The Activity?',
        actionVoidCallBack: () {
          _updateChosenCreatedActivityMakeItInactive(context);
          _displayLeavingActivityDialog(context);
        },
        cancelVoidCallBack: () {},
      );

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayLeavingActivityDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return _listenCreatedActivityBroughtFromDBAfterDeletingFromTheActivity();
          });

  // LISTEN ============================================================================================================
  BlocListener<CreatedActivityBloc, CreatedActivityState>
      _listenCreatedActivityBroughtFromDBAfterDeletingFromTheActivity() {
    return BlocListener<CreatedActivityBloc, CreatedActivityState>(
      listenWhen: (previous, current) =>
          _checkWhetherCreatedActivityBroughtSuccessfully(current),
      listener: (context, state) {
        _recallCreatedActivityDynamicWithDistanceCreatedByUserBloc(context);
      },
      child: _buildChosenCreatedActivityBroughtFromDB(),
    );
  }

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  _checkWhetherCreatedActivityBroughtSuccessfully(
          CreatedActivityState current) =>
      current.status == Status.success;

  // BUILD =============================================================================================================
  BlocBuilder<CreatedActivityBloc, CreatedActivityState>
      _buildChosenCreatedActivityBroughtFromDB() =>
          BlocBuilder<CreatedActivityBloc, CreatedActivityState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return DBProcessLoader();
                case Status.loading:
                  return DBProcessLoader();
                case Status.success:
                  return _initiateEndingProcess(context);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  // END METHODS =======================================================================================================
  LoadSuccessfullyAlertDialog _initiateEndingProcess(BuildContext context) {
    _closeTheScreenWithDelaying(context);
    return _displayLoadSuccessfullyDialog();
  }

  // DISPLAY ===========================================================================================================
  LoadSuccessfullyAlertDialog _displayLoadSuccessfullyDialog() {
    return const LoadSuccessfullyAlertDialog(
        content:
            'The process which you chose has been completed without any mistake');
  }

  // METHODS ===========================================================================================================
  // Datebase Methods --------------------------------------------------------------------------------------------------
  void _updateChosenCreatedActivityMakeItInactive(BuildContext context) {
    context.read<CreatedActivityBloc>().add(UpdateCreatedActivityEvent(
        createdActivity: _createCreatedActivityInstance(context)));
  }

  void _recallCreatedActivityDynamicWithDistanceCreatedByUserBloc(
      BuildContext context) {
    context
        .read<CreatedActivityDynamicWithDistanceCreatedByUserBloc>()
        .add(RecallCreatedActivityDynamicWithDistanceCreatedByUserEvent());
    context.read<CreatedActivityDynamicWithDistanceCreatedByUserBloc>().add(
        LoadCreatedActivityDynamicWithDistanceCreatedByUserEvent(
            uId: _appNumberConstants.appUserId, offset: 0));
  }

  // Find Methods ------------------------------------------------------------------------------------------------------
  CreatedActivityDynamicWithDistance _findChosenActivity(
          BuildContext context) =>
      context
          .read<ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit>()
          .state
          .chosenCreatedActivityDynamicWithDistanceList
          .last;

  int? _findCreatedActivityId(BuildContext context) =>
      _findChosenActivity(context).createdActivityId;

  int _findHostId(BuildContext context) =>
      _findChosenActivity(context).host.uId!;

  int _findActivityNameId(BuildContext context) =>
      _findChosenActivity(context).activityNameDynamic.activityNameId!;

  int _findLocationId(BuildContext context) =>
      _findChosenActivity(context).locationDetailDynamic.locationDetailId!;

  DateTime _findCreatedAt(BuildContext context) =>
      _findChosenActivity(context).createdAt;

  DateTime _findDateTimeNow() => DateTime.now();

  // Create Instance ---------------------------------------------------------------------------------------------------
  CreatedActivity _createCreatedActivityInstance(BuildContext context) {
    final CreatedActivity createdActivity = CreatedActivity(
      createdActivityId: _findCreatedActivityId(context),
      hostId: _findHostId(context),
      activityNameId: _findActivityNameId(context),
      locationDetailId: _findLocationId(context),
      createdAt: _findCreatedAt(context),
      updatedAt: _findDateTimeNow(),
      deactivatedAt: _findDateTimeNow(),
      isActive: false,
    );
    return createdActivity;
  }

  // Unchoose Methods --------------------------------------------------------------------------------------------------
  void _unchooseChosenActivity(BuildContext context) {
    context
        .read<
            ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc>()
        .add(
            CleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess());
  }

  // Screen Methods ----------------------------------------------------------------------------------------------------
  void _closeTheScreenWithDelaying(BuildContext context) {
    Future.delayed(_appTimeConstants.timeOutDuration, () {
      _closePopUp(context);
    });
  }

  void _closePopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 3);
  }
}
