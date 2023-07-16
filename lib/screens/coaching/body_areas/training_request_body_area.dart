import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/local_widgets/zlocal_widgets.dart';
import 'package:my_project/screens/coaching/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingRequestBodyArea extends StatefulWidget {
  const TrainingRequestBodyArea({Key? key}) : super(key: key);

  @override
  State<TrainingRequestBodyArea> createState() =>
      _TrainingRequestBodyAreaState();
}

class _TrainingRequestBodyAreaState extends State<TrainingRequestBodyArea> {
  final AppFunctions _appFunctions = AppFunctions();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit
        chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit =
        context.read<
            ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit>();
    final TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc =
        context.read<
            TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc>();
    TextStyle headlineSmall = Theme.of(context).textTheme.headlineSmall!;
    double screenWidth = MediaQuery.of(context).size.width;

    return _bringTrainingRequestFromDatabaseAndDisplayThem(
        chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
        screenWidth,
        headlineSmall);
  }

  /// SKELTON ==========================================================================================================
  BasicScrollView _createActivityTemplateSkeltonArea() =>
      BasicScrollView(children: [
        AppWrap(
            wrapSpacing: 18,
            wrapRunSpacing: 0,
            children: _displayRequestSkeltonListGenerate())
      ]);

  List<Widget> _displayRequestSkeltonListGenerate() =>
      List.generate(3, (index) => const SkeltonOfTraining());

  /// BLOC =============================================================================================================
  BlocBuilder<TrainingRequestDynamicRequestedByUserBloc,
          TrainingRequestDynamicRequestedByUserState>
      _bringTrainingRequestFromDatabaseAndDisplayThem(
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit
        chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
          BlocBuilder<TrainingRequestDynamicRequestedByUserBloc,
              TrainingRequestDynamicRequestedByUserState>(
            builder: (context, requestState) {
              switch (requestState.status) {
                case StatusWithoutLoading.initial:
                  return _createActivityTemplateSkeltonArea();
                case StatusWithoutLoading.success:
                  if (_checkNoTrainingRequest(requestState)) {
                    return const InformationAboutExisting(
                        detailLabel: 'respond');
                  } else {
                    return _createActivityTypeArea(
                        context,
                        requestState,
                        chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
                        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
                        screenWidth,
                        headlineSmall);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: requestState.error);
              }
            },
          );

  /// CREATE =================================================================================================
  BasicScrollView _createActivityTypeArea(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserState requestState,
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit
        chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
      BasicScrollView(
          controller: _scrollController,
          children: _generateActivityTypeDetails(
              context,
              requestState,
              chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
              trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
              screenWidth,
              headlineSmall));

  /// GENERATE =================================================================================================
  List<Widget> _generateActivityTypeDetails(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserState requestState,
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit
        chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
      List.generate(
          requestState.hasReachedMax == true
              ? requestState.trainingRequestDynamicList.length
              : requestState.trainingRequestDynamicList.length + 1,
          (index) => index >= requestState.trainingRequestDynamicList.length
              ? const BottomLoader()
              : _generateTrainingRequestArea(
                  context,
                  requestState,
                  chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
                  trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
                  screenWidth,
                  index,
                  headlineSmall));

  GestureDetector _generateTrainingRequestArea(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserState requestState,
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit
        chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
    double screenWidth,
    int index,
    TextStyle headlineSmall,
  ) =>
      GestureDetector(
          onTap: () => _goToTrainingRequestResponsePageWithBringingNecessaryBlocs(
              context,
              requestState,
              chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
              trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
              index),
          child: _displayTrainingRequestChoiceColumn(
              context, requestState, screenWidth, index, headlineSmall));

  /// DISPLAY ==========================================================================================================
  CircleImageDetailedChoiceColumn _displayTrainingRequestChoiceColumn(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserState requestState,
    double screenWidth,
    int index,
    TextStyle headlineSmall,
  ) =>
      CircleImageDetailedChoiceColumn(
          additionalSpaceOnBottom: 18,
          textStyle: headlineSmall.copyWith(fontWeight: FontWeight.normal),
          imageWidget: _displayTrainingRequestPhoto(
              context, requestState, screenWidth, index),
          firstLabel: _displayTrainingRequestActivityTitle(requestState, index),
          secondLabel: '');

  Hero _displayTrainingRequestPhoto(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserState requestState,
    double screenWidth,
    int index,
  ) =>
      Hero(
          tag: _heroTag(requestState, index),
          child: _displayActivityPicture(
              context, requestState, screenWidth, index));

  CustomImageContainer _displayActivityPicture(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserState requestState,
    double screenWidth,
    int index,
  ) =>
      CustomImageContainer(
          height: 200,
          width: screenWidth,
          asset: _findTrainingPicture(requestState, index));

  String _displayTrainingRequestActivityTitle(
    TrainingRequestDynamicRequestedByUserState requestState,
    int index,
  ) =>
      _appFunctions.setWithoutUnderscore(requestState.trainingRequestDynamicList
          .elementAt(index)
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle);

  /// METHODS ==========================================================================================================
  void _goToTrainingRequestResponsePageWithBringingNecessaryBlocs(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserState requestState,
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit
        chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
    int index,
  ) {
    _assignClickedTrainingRequestAsChosenTrainingRequest(context, requestState,
        chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit, index);
    _bringTrainingRequestResponseFromDatabase(context, requestState,
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc, index);
    _goToChosenTrainingRequestResponseScreen(context);
  }

  void _bringTrainingRequestResponseFromDatabase(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserState requestState,
    TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc
        trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc,
    int index,
  ) =>
      trainingRequestResponseDynamicWithDistanceByTrainingRequestBloc.add(
          LoadTrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent(
              trainingRequestId:
                  _findChosenTrainingRequestId(requestState, index)));

  void _assignClickedTrainingRequestAsChosenTrainingRequest(
    BuildContext context,
    TrainingRequestDynamicRequestedByUserState requestState,
    ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit
        chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit,
    int index,
  ) {
    if (kDebugMode) {
      print(requestState.trainingRequestDynamicList
          .elementAt(index)
          .trainingRequestId);
    }
    //
    // BlocProvider.of<
    //             ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit>(
    //         context)
    //     .pressTrainingRequest(requestState
    //         .trainingRequestDynamicList
    //         .elementAt(index));
    chosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit
        .pressTrainingRequest(
            requestState.trainingRequestDynamicList.elementAt(index));
  }

  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _heroTag(
    TrainingRequestDynamicRequestedByUserState requestState,
    int index,
  ) =>
      requestState.trainingRequestDynamicList
          .elementAt(index)
          .trainingRequestId
          .toString();

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkNoTrainingRequest(
    TrainingRequestDynamicRequestedByUserState requestState,
  ) =>
      requestState.trainingRequestDynamicList.isEmpty;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int _findChosenTrainingRequestId(
    TrainingRequestDynamicRequestedByUserState requestState,
    int index,
  ) =>
      requestState.trainingRequestDynamicList
          .elementAt(index)
          .trainingRequestId!;

  String _findTrainingPicture(
    TrainingRequestDynamicRequestedByUserState requestState,
    int index,
  ) =>
      'assets/images/activities/${requestState.trainingRequestDynamicList.elementAt(index).trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg';

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenTrainingRequestResponseScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfTrainingRequestResponse.routeName);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        context.read<TrainingRequestDynamicRequestedByUserBloc>().add(
            LoadTrainingRequestDynamicRequestedByUserEvent(
                uId: AppNumberConstants().appUserId,
                offset: context
                    .read<TrainingRequestDynamicRequestedByUserBloc>()
                    .state
                    .trainingRequestDynamicList
                    .length));
      }
    }
  }
}
