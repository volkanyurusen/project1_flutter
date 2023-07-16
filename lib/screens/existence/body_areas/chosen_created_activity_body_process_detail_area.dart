import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class ChosenCreatedActivityBodyProcessDetailArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final double screenWidth;
  final int onWhichNumber = 0;

  ChosenCreatedActivityBodyProcessDetailArea({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc =
        context.read<UserFollowingDynamicByUserBloc>();
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc =
        context.read<UserLikingDynamicByUserBloc>();
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc =
        context.read<ConsistedActivityDynamicWithDistanceByUserBloc>();
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit =
        context.read<ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit>();

    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;
    Color processDetailColor = _appColors.onSecondary;

    return Column(
      children: [
        _bringAttendeesDetail(
            userFollowingDynamicByUserBloc,
            userLikingDynamicByUserBloc,
            consistedActivityDynamicWithDistanceByUserBloc,
            chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
            headlineSmall,
            processDetailColor),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// LOADING ==========================================================================================================
  CustomColumn _createLoadingArea() => const CustomColumn(
      children: [CustomAppSizedBox(height: 100), StateLoading()]);

  /// BLOC =============================================================================================================
  BlocBuilder<
          ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc,
          ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState>
      _bringAttendeesDetail(
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    TextStyle headlineSmall,
    Color processDetailColor,
  ) =>
          BlocBuilder<
              ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc,
              ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState>(
            builder: (context, state) {
              List<String> processWhereAttendeesStayOn = <String>[];
              List<String> uniqueProcessDetailNamesOfCreatedActivity =
                  <String>[];
              _createSetBasedOnProcessNameWhereAttendeesStayOn(
                  state, processWhereAttendeesStayOn);
              _createSetBasedOnUniqueProcessNameWhereAttendeesStayOn(
                  state, uniqueProcessDetailNamesOfCreatedActivity);
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return _createLoadingArea();
                case StatusWithoutLoading.success:
                  if (_isAttendeeListEmpty(state)) {
                    return const SizedBox();
                  } else {
                    return CustomColumn(
                        children: _createAttendeeAreaClassifiedProcessName(
                      context,
                      state,
                      userFollowingDynamicByUserBloc,
                      userLikingDynamicByUserBloc,
                      consistedActivityDynamicWithDistanceByUserBloc,
                      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
                      uniqueProcessDetailNamesOfCreatedActivity,
                      processWhereAttendeesStayOn,
                      onWhichNumber,
                      headlineSmall,
                      processDetailColor,
                    ));
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ===========================================================================================================
  List<Widget> _createAttendeeAreaClassifiedProcessName(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    List<String> uniqueProcessDetailNamesOfCreatedActivity,
    List<String> processWhereAttendeesStayOn,
    int onWhichNumber,
    TextStyle headlineSmall,
    Color processDetailColor,
  ) =>
      List.generate(
        state.hasReachedMax == true
            ? uniqueProcessDetailNamesOfCreatedActivity.length
            : uniqueProcessDetailNamesOfCreatedActivity.length + 1,
        (index) => index >= uniqueProcessDetailNamesOfCreatedActivity.length
            ? const BottomLoader()
            : CustomColumn(children: [
                const CustomAppSizedBox(height: 18),
                _displayUniqueProcess(uniqueProcessDetailNamesOfCreatedActivity,
                    index, headlineSmall, processDetailColor),
                AppWrap(
                  wrapSpacing: 18,
                  wrapRunSpacing: 5,
                  children: List.generate(
                    processWhereAttendeesStayOn
                        .where((element) =>
                            element ==
                            uniqueProcessDetailNamesOfCreatedActivity
                                .elementAt(index))
                        .length,
                    (secondIndex) {
                      int chosenIndex = onWhichNumber;
                      onWhichNumber++;
                      return GestureDetector(
                        onLongPress: () {},
                        onTap: () {
                          _goToChosenAttendeeScreenWithBringingNecessaryBlocs(
                              context,
                              state,
                              userFollowingDynamicByUserBloc,
                              userLikingDynamicByUserBloc,
                              consistedActivityDynamicWithDistanceByUserBloc,
                              chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
                              chosenIndex);
                        },
                        child: _generateAttendeeArea(state, chosenIndex),
                      );
                    },
                  ),
                ),
              ]),
      );

  /// GENERATE =========================================================================================================
  ImageChoiceColumn _generateAttendeeArea(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    int chosenIndex,
  ) =>
      ImageChoiceColumn(
        imageWidget: Hero(
          tag: _heroTag(state, chosenIndex),
          child: _displayAttendeesPhoto(state, chosenIndex),
        ),
        username: _displayAttendeeUsername(state, chosenIndex),
        distance: _displayAttendeeDistance(state, chosenIndex),
      );

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayUniqueProcess(
    List<String> uniqueProcessDetailNamesOfCreatedActivity,
    int index,
    TextStyle headlineSmall,
    Color processDetailColor,
  ) =>
      AppHeaderText(
          textLabel: uniqueProcessDetailNamesOfCreatedActivity.elementAt(index),
          textStyle: headlineSmall.copyWith(color: processDetailColor));

  UserImageContainer _displayAttendeesPhoto(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    int chosenIndex,
  ) =>
      UserImageContainer(
          height: 75, width: 75, url: _findAttendeePhoto(state, chosenIndex));

  String _displayAttendeeUsername(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    int chosenIndex,
  ) =>
      _findAttendeeUsername(state, chosenIndex);

  String _displayAttendeeDistance(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    int chosenIndex,
  ) =>
      _findAttendeeDistance(state, chosenIndex);

  /// METHODS ==========================================================================================================
  void _goToChosenAttendeeScreenWithBringingNecessaryBlocs(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    int chosenIndex,
  ) {
    _bringAttendeeFollowingDetailFromDatabase(
        state, userFollowingDynamicByUserBloc, chosenIndex);
    _bringAttendeeLikeDetailFromDatabase(
        state, userLikingDynamicByUserBloc, chosenIndex);
    _bringConsistedActivityDetailFromDatabaseBasedOnAttendee(
        state, consistedActivityDynamicWithDistanceByUserBloc, chosenIndex);
    _assignTheAttendeeAsChosenAttendee(state,
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit, chosenIndex);
    _goToChosenAttendeeScreen(context);
  }

  void _createSetBasedOnProcessNameWhereAttendeesStayOn(
      ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
          state,
      List<String> processWhereAttendeesStayOn) {
    for (var element in state.consistedActivityDynamicWithDistanceList) {
      processWhereAttendeesStayOn.add(element.processDetailDynamic.processName);
    }
  }

  void _createSetBasedOnUniqueProcessNameWhereAttendeesStayOn(
      ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
          state,
      List<String> uniqueProcessDetailNamesOfCreatedActivity) {
    for (var element in state.consistedActivityDynamicWithDistanceList) {
      if (uniqueProcessDetailNamesOfCreatedActivity
          .contains(element.processDetailDynamic.processName)) {
      } else {
        uniqueProcessDetailNamesOfCreatedActivity
            .add(element.processDetailDynamic.processName);
      }
    }
  }

  /// Check Method -----------------------------------------------------------------------------------------------------
  bool _isAttendeeListEmpty(
          ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
              state) =>
      state.consistedActivityDynamicWithDistanceList.isEmpty;

  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _heroTag(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    int chosenIndex,
  ) =>
      '${state.consistedActivityDynamicWithDistanceList[chosenIndex].consistedActivityId} ${state.consistedActivityDynamicWithDistanceList[chosenIndex].attendee.username}';

  /// Find Method ------------------------------------------------------------------------------------------------------
  String _findAttendeePhoto(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    int chosenIndex,
  ) =>
      state.consistedActivityDynamicWithDistanceList[chosenIndex].attendee
          .picUrl;

  String _findAttendeeUsername(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    int chosenIndex,
  ) =>
      state.consistedActivityDynamicWithDistanceList[chosenIndex].attendee
          .username;

  String _findAttendeeDistance(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    int chosenIndex,
  ) =>
      '${state.consistedActivityDynamicWithDistanceList[chosenIndex].distanceBetween.round().toString()} km';

  int _findAttendeeUserId(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    int chosenIndex,
  ) =>
      state.consistedActivityDynamicWithDistanceList[chosenIndex].attendee.uId!;

  /// Other Method -----------------------------------------------------------------------------------------------------
  void _assignTheAttendeeAsChosenAttendee(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
        chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit,
    int chosenIndex,
  ) =>
      chosenAttendeeOnCreationAmongThoseWhoSentRequestCubit
          .pressChosenAttendeeOnCreation(
              state.consistedActivityDynamicWithDistanceList[chosenIndex]);

  /// Request From DB Method -------------------------------------------------------------------------------------------
  void _bringConsistedActivityDetailFromDatabaseBasedOnAttendee(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    ConsistedActivityDynamicWithDistanceByUserBloc
        consistedActivityDynamicWithDistanceByUserBloc,
    int chosenIndex,
  ) =>
      consistedActivityDynamicWithDistanceByUserBloc.add(
          LoadConsistedActivityDynamicWithDistanceByUserEvent(
              uId: _findAttendeeUserId(state, chosenIndex)));

  void _bringAttendeeLikeDetailFromDatabase(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    UserLikingDynamicByUserBloc userLikingDynamicByUserBloc,
    int chosenIndex,
  ) =>
      userLikingDynamicByUserBloc.add(LoadUserLikingDynamicByUserEvent(
          uId: _findAttendeeUserId(state, chosenIndex)));

  void _bringAttendeeFollowingDetailFromDatabase(
    ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
        state,
    UserFollowingDynamicByUserBloc userFollowingDynamicByUserBloc,
    int chosenIndex,
  ) =>
      userFollowingDynamicByUserBloc.add(LoadUserFollowingDynamicByUserEvent(
          uId: _findAttendeeUserId(state, chosenIndex)));

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  Future<dynamic> _goToChosenAttendeeScreen(BuildContext context) =>
      Navigator.of(context)
          .pushNamed(ScreenOfChosenAttendeeOnCreation.routeName);
}
