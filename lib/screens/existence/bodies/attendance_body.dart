import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class AttendanceBody extends StatefulWidget {
  final List<DateTime> firstDayOfContainingWeekOfActivityDate;
  final List<DateTime> uniqueFirstDayOfContainingWeekOfActivityDate;

  const AttendanceBody({
    required this.firstDayOfContainingWeekOfActivityDate,
    required this.uniqueFirstDayOfContainingWeekOfActivityDate,
    Key? key,
  }) : super(key: key);

  @override
  State<AttendanceBody> createState() => _AttendanceBodyState();
}

class _AttendanceBodyState extends State<AttendanceBody> {
  final AppFunctions _appFunctions = AppFunctions();
  final ScrollController _scrollController = ScrollController();
  final int onWhichNumber = 0;

  @override
  void initState() {
    super.initState();
    if (context
            .read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>()
            .state
            .hasReachedMax !=
        true) {
      _scrollController.addListener(_onScroll);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ConsistedActivityDynamicWithDistanceAttendedByUserState state =
        context
            .read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>()
            .state;
    final ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit
        chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit =
        context.read<
            ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit>();
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;

    return SingleChildScrollView(
      controller: _scrollController,
      child: CustomColumn(
          children: _createCustomColumnBasedOnClassifiedActivityDate(
              context,
              state,
              chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
              onWhichNumber,
              widget.firstDayOfContainingWeekOfActivityDate,
              widget.uniqueFirstDayOfContainingWeekOfActivityDate,
              headlineSmall)),
    );
  }

  /// CREATE ===========================================================================================================
  List<Widget> _createCustomColumnBasedOnClassifiedActivityDate(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit
        chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
    int onWhichNumber,
    List<DateTime> firstDayOfContainingWeekOfActivityDate,
    List<DateTime> uniqueFirstDayOfContainingWeekOfActivityDate,
    TextStyle headlineSmall,
  ) =>
      List.generate(
        state.hasReachedMax == true
            ? uniqueFirstDayOfContainingWeekOfActivityDate.length
            : uniqueFirstDayOfContainingWeekOfActivityDate.length + 1,
        (index) => index >= uniqueFirstDayOfContainingWeekOfActivityDate.length
            ? const BottomLoader()
            : CustomColumn(
                children: [
                  onWhichNumber == 0
                      ? const CustomAppSizedBox()
                      : const CustomAppSizedBox(height: 32),
                  _displayActivityDateBasedOnDateOfWeek(
                      uniqueFirstDayOfContainingWeekOfActivityDate,
                      index,
                      headlineSmall),
                  AppWrap(
                    wrapSpacing: 18,
                    wrapRunSpacing: 5,
                    children: List.generate(
                      firstDayOfContainingWeekOfActivityDate
                          .where((element) =>
                              element ==
                              uniqueFirstDayOfContainingWeekOfActivityDate
                                  .elementAt(index))
                          .length,
                      (secondindex) {
                        int chosenIndex = onWhichNumber;
                        onWhichNumber++;
                        return _generateAttendanceArea(
                            context,
                            state,
                            chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
                            chosenIndex);
                      },
                    ),
                  ),
                ],
              ),
      );

  /// GENERATE =========================================================================================================
  GestureDetector _generateAttendanceArea(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit
        chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
    int chosenIndex,
  ) =>
      GestureDetector(
          onTap: () =>
              _goToTheDetailOfChosenConsistedActivityWithBringingNecessaryBlocs(
                  context,
                  state,
                  chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
                  chosenIndex),
          child: _displayChoiceColumn(state, chosenIndex));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayActivityDateBasedOnDateOfWeek(
    List<DateTime> uniqueFirstDayOfContainingWeekOfActivityDate,
    int index,
    TextStyle headlineSmall,
  ) =>
      AppHeaderText(
          textLabel: _appFunctions.bringBeginningDateOfWeek(
              uniqueFirstDayOfContainingWeekOfActivityDate.elementAt(index)),
          textStyle: headlineSmall);

  CircleImageDetailedChoiceColumn _displayChoiceColumn(
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
    int chosenIndex,
  ) =>
      CircleImageDetailedChoiceColumn(
          imageWidget: _displayHostPhoto(state, chosenIndex),
          firstLabel: '',
          secondLabel: _displayctivityTitle(state, chosenIndex));

  UserImageContainer _displayHostPhoto(
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
    int chosenIndex,
  ) =>
      UserImageContainer(url: _findHostPhoto(state, chosenIndex));


  String _displayctivityTitle(
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
    int chosenIndex,
  ) =>
      _appFunctions.showString(_appFunctions
          .setWithoutUnderscore(_findActivityTitle(state, chosenIndex)));

  void _goToTheDetailOfChosenConsistedActivityWithBringingNecessaryBlocs(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit
        chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
    int chosenIndex,
  ) {
    _defineClickedConsistedActivity(
        state,
        chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
        chosenIndex);
    _brindChosenHostDetailFromDatabase(context, state, chosenIndex);
    _goToChosenConsistedActivityScreen(context);
  }

  void _defineClickedConsistedActivity(
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
    ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit
        chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
    int chosenIndex,
  ) =>
      chosenActivityAmongConsistedActivityDynamicAttendedByUserCubit
          .pressUserCard(
              state.consistedActivityDynamicWithDistanceList[chosenIndex]);

  void _brindChosenHostDetailFromDatabase(
    BuildContext context,
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
    int chosenIndex,
  ) {
    if (kDebugMode) {
      print(state.consistedActivityDynamicWithDistanceList[chosenIndex]
          .createdActivityDynamic.createdActivityId);
    }
    BlocProvider.of<ConsistedActivityDynamicWithDistanceByCreatedActivityBloc>(
            context)
        .add(LoadConsistedActivityDynamicWithDistanceByCreatedActivityEvent(
            createdActivityId: state
                .consistedActivityDynamicWithDistanceList[chosenIndex]
                .createdActivityDynamic
                .createdActivityId!));
    context
        .read<
            ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetBloc>()
        .add(
            LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset(
                createdActivityId: state
                    .consistedActivityDynamicWithDistanceList[chosenIndex]
                    .createdActivityDynamic
                    .createdActivityId!));
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool isAttendanceListEmpty(
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
  ) =>
      state.consistedActivityDynamicWithDistanceList.isEmpty;

  /// Other Methods ----------------------------------------------------------------------------------------------------
  String _findHostPhoto(
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
    int chosenIndex,
  ) =>
      state.consistedActivityDynamicWithDistanceList[chosenIndex]
          .createdActivityDynamic.host.picUrl;


  String _findActivityTitle(
    ConsistedActivityDynamicWithDistanceAttendedByUserState state,
    int chosenIndex,
  ) =>
      state
          .consistedActivityDynamicWithDistanceList[chosenIndex]
          .createdActivityDynamic
          .activityNameDynamic
          .activityTitle;

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  Future<dynamic> _goToChosenConsistedActivityScreen(
    BuildContext context,
  ) =>
      Navigator.of(context)
          .pushNamed(ScreenOfChosenConsistedActivity.routeName);

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (context
            .read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>()
            .state
            .hasReachedMax ==
        false) {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          context
              .read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>()
              .add(LoadConsistedActivityDynamicWithDistanceAttendedByUserEvent(
                  uId: AppNumberConstants().appUserId,
                  offset: context
                      .read<
                          ConsistedActivityDynamicWithDistanceAttendedByUserBloc>()
                      .state
                      .consistedActivityDynamicWithDistanceList
                      .length));
        }
      }
    }
  }
}
