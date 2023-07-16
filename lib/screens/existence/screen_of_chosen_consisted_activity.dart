import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/existence/bodies/zbodies.dart';
import 'package:my_project/screens/existence/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfChosenConsistedActivity extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_consisted_activity';

  const ScreenOfChosenConsistedActivity({Key? key}) : super(key: key);

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
          body: ChosenConsistedActivityBody(screenWidth: screenWidth)),
    );
  }

  // APP BAR ===========================================================================================================
  /// CREATE ===========================================================================================================
  PreferredSizeForPicture _createActivityPictureOnTop(BuildContext context) =>
      PreferredSizeForPicture(
          context: context,
          child: AppBar(
            flexibleSpace: _buildChosenActivityPhoto(),
            actions: [_buildLeaveIcon()],
          ));

  /// CHOSEN ACTIVITY PICTURE ON TOP ===================================================================================
  /// BLOC =============================================================================================================
  BlocBuilder<ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
          ChosenActivityAmongConsistedActivityDynamicAttendedByUserState>
      _buildChosenActivityPhoto() => BlocBuilder<
              ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
              ChosenActivityAmongConsistedActivityDynamicAttendedByUserState>(
          builder: (context, state) => AppBarHero(
              tag: _heroTag(state), image: _displayChoiceActivityImage(state)));

  /// DISPLAY ==========================================================================================================
  AssetImage _displayChoiceActivityImage(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      AssetImage(_findActivityPhotoFromAssets(chosenState));

  /// METHODS ==========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityPhotoFromAssets(
          ChosenActivityAmongConsistedActivityDynamicAttendedByUserState
              chosenState) =>
      'assets/images/activities/${_findActivityTitle(chosenState)}.jpg';

  String _findActivityTitle(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      chosenState
          .chosenConsistedActivityDynamicWithDistanceList
          .last
          .createdActivityDynamic
          .activityNameDynamic
          .activityTitle
          .toLowerCase();

  /// METHOD ===========================================================================================================
  /// Hero Methods -----------------------------------------------------------------------------------------------------
  String _heroTag(
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      '${chosenState.chosenConsistedActivityDynamicWithDistanceList.last.createdActivityDynamic.host.username}+${chosenState.chosenConsistedActivityDynamicWithDistanceList.last.createdActivityDynamic.createdActivityId}';

  /// LEAVE FROM ACTIVITY ICON =========================================================================================
  /// BLOC =============================================================================================================
  BlocBuilder<ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
          ChosenActivityAmongConsistedActivityDynamicAttendedByUserState>
      _buildLeaveIcon() => BlocBuilder<
              ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
              ChosenActivityAmongConsistedActivityDynamicAttendedByUserState>(
          builder: (context, state) => _createIconButtonArea(context, state));

  // CREATE ============================================================================================================
  IconButton _createIconButtonArea(
    BuildContext context,
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState state,
  ) =>
      IconButton(
          splashRadius: 18,
          icon: _displayIcon(),
          onPressed: () {
            _openLeaveTheActivityPopUp(context, state);
          });

  /// DISPLAY ==========================================================================================================
  Icon _displayIcon() => const Icon(Icons.logout_rounded);

  /// METHODS ==========================================================================================================
  void _openLeaveTheActivityPopUp(
    BuildContext context,
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserState chosenState,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return LeaveTheActivityPopUp();
          });

  /// Unchoose Methods -------------------------------------------------------------------------------------------------
  void _unchooseChosenActivity(BuildContext context) {
    context
        .read<
            ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetBloc>()
        .add(
            CleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset());
  }
}
