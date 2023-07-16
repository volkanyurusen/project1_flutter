import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class CreationBody extends StatefulWidget {
  final List<DateTime> firstDayOfContainingWeekOfActivityDate;
  final List<DateTime> uniqueFirstDayOfContainingWeekOfActivityDate;

  const CreationBody({
    required this.firstDayOfContainingWeekOfActivityDate,
    required this.uniqueFirstDayOfContainingWeekOfActivityDate,
    Key? key,
  }) : super(key: key);

  @override
  State<CreationBody> createState() => _CreationBodyState();
}

class _CreationBodyState extends State<CreationBody> {
  final AppFunctions _appFunctions = AppFunctions();
  final ScrollController _scrollController = ScrollController();
  final int onWhichNumber = 0;

  @override
  void initState() {
    super.initState();
    if (context
            .read<CreatedActivityDynamicWithDistanceCreatedByUserBloc>()
            .state
            .hasReachedMax !=
        true) {
      _scrollController.addListener(_onScroll);
    }
  }

  @override
  Widget build(BuildContext context) {
    final CreatedActivityDynamicWithDistanceCreatedByUserState state = context
        .read<CreatedActivityDynamicWithDistanceCreatedByUserBloc>()
        .state;
    final ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit
        chosenActivityAmongCreatedActivityDynamicCreatedByUserCubit =
        context.read<
            ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit>();
    TextStyle? headlineSmall = Theme.of(context).textTheme.headlineSmall!;

    return SingleChildScrollView(
      controller: _scrollController,
      child: CustomColumn(
          children: _createCustomColumnBasedOnClassifiedActivityDate(
              context,
              state,
              chosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
              onWhichNumber,
              widget.firstDayOfContainingWeekOfActivityDate,
              widget.uniqueFirstDayOfContainingWeekOfActivityDate,
              headlineSmall)),
    );
  }

  /// CREATE ===========================================================================================================
  List<Widget> _createCustomColumnBasedOnClassifiedActivityDate(
    BuildContext context,
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit
        chosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
    int onWhichNumber,
    List<dynamic> firstDayOfContainingWeekOfActivityDate,
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
                      (secondIndex) {
                        int chosenIndex = onWhichNumber;
                        onWhichNumber++;
                        return _generateCreationArea(
                            context,
                            state,
                            chosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
                            chosenIndex);
                      },
                    ),
                  ),
                ],
              ),
      );

  /// GENERATE =========================================================================================================
  GestureDetector _generateCreationArea(
    BuildContext context,
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit
        chosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
    int chosenIndex,
  ) =>
      GestureDetector(
          child: _displayChoiceColumn(state, chosenIndex),
          onTap: () =>
              _goToTheDetailOfChosenCreatedActivityWithBringingNecessaryBlocs(
                  context,
                  state,
                  chosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
                  chosenIndex));

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
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    int chosenIndex,
  ) =>
      CircleImageDetailedChoiceColumn(
          imageWidget: _displayActivityPhotoWithHero(state, chosenIndex),
          firstLabel: '',
          secondLabel: _displayctivityTitle(state, chosenIndex));

  Hero _displayActivityPhotoWithHero(
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    int chosenIndex,
  ) =>
      Hero(
          tag: _heroTag(state, chosenIndex),
          child: _displayActivityPhoto(state, chosenIndex));

  CustomImageContainer _displayActivityPhoto(
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    int chosenIndex,
  ) =>
      CustomImageContainer(asset: _findActivityPhoto(state, chosenIndex));


  String _displayctivityTitle(
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    int chosenIndex,
  ) =>
      _appFunctions.showString(_appFunctions
          .setWithoutUnderscore(_findActivityTitle(state, chosenIndex)));

  /// METHODS ========================================================================================================
  void _goToTheDetailOfChosenCreatedActivityWithBringingNecessaryBlocs(
    BuildContext context,
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit
        chosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
    int chosenIndex,
  ) {
    if (kDebugMode) {
      print(state.createdActivityDynamicWithDistanceList[chosenIndex]
          .createdActivityId);
    }
    _defineClickedCreatedActivity(
        state,
        chosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
        chosenIndex);
    _brindConsistedActivityDetailFromDatabaseBasedOnCreatedActivity(
        context, state, chosenIndex);
    _goToChosenCreatedActivityScreen(context);
  }

  /// Check Method -----------------------------------------------------------------------------------------------------
  bool isCreationListEmpty(
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
  ) =>
      state.createdActivityDynamicWithDistanceList.isEmpty;

  /// Other Method -----------------------------------------------------------------------------------------------------
  String _heroTag(
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    int chosenIndex,
  ) =>
      '${state.createdActivityDynamicWithDistanceList[chosenIndex].host.username}+${state.createdActivityDynamicWithDistanceList[chosenIndex].createdActivityId}';


  void _defineClickedCreatedActivity(
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit
        chosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
    int chosenIndex,
  ) =>
      chosenActivityAmongCreatedActivityDynamicCreatedByUserCubit
          .pressCreatedActivity(
              state.createdActivityDynamicWithDistanceList[chosenIndex]);

  /// Find Method ------------------------------------------------------------------------------------------------------
  String _findActivityPhoto(
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    int chosenIndex,
  ) =>
      'assets/images/activities/${state.createdActivityDynamicWithDistanceList[chosenIndex].activityNameDynamic.activityTitle.toLowerCase()}.jpg';


  String _findActivityTitle(
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    int chosenIndex,
  ) =>
      state.createdActivityDynamicWithDistanceList[chosenIndex]
          .activityNameDynamic.activityTitle;

  /// Request From DB Method -------------------------------------------------------------------------------------------
  void _brindConsistedActivityDetailFromDatabaseBasedOnCreatedActivity(
    BuildContext context,
    CreatedActivityDynamicWithDistanceCreatedByUserState state,
    int chosenIndex,
  ) =>
      BlocProvider.of<
                  ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc>(
              context)
          .add(
              LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess(
                  createdActivityId: state
                      .createdActivityDynamicWithDistanceList[chosenIndex]
                      .createdActivityId!));

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  Future<dynamic> _goToChosenCreatedActivityScreen(
    BuildContext context,
  ) =>
      Navigator.of(context).pushNamed(ScreenOfChosenCreatedActivity.routeName);

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (context
            .read<CreatedActivityDynamicWithDistanceCreatedByUserBloc>()
            .state
            .hasReachedMax ==
        false) {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          context
              .read<CreatedActivityDynamicWithDistanceCreatedByUserBloc>()
              .add(LoadCreatedActivityDynamicWithDistanceCreatedByUserEvent(
                  uId: AppNumberConstants().appUserId,
                  offset: context
                      .read<
                          CreatedActivityDynamicWithDistanceCreatedByUserBloc>()
                      .state
                      .createdActivityDynamicWithDistanceList
                      .length));
        }
      }
    }
  }
}
