import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/local_widgets/zlocal_widgets.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingOfferBodyArea extends StatefulWidget {
  const TrainingOfferBodyArea({Key? key}) : super(key: key);

  @override
  State<TrainingOfferBodyArea> createState() => _TrainingOfferBodyAreaState();
}

class _TrainingOfferBodyAreaState extends State<TrainingOfferBodyArea> {
  final AppFunctions _appFunctions = AppFunctions();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit
        chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit = context
            .read<ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit>();
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc =
        context.read<
            TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc>();
    TextStyle headlineSmall = context.textTheme.headlineSmall!;
    double screenWidth = context.width;

    return _bringTrainingOfferFromDatabaseAndDisplayThem(
        chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
        screenWidth,
        headlineSmall);
  }

  /// SKELTON ==========================================================================================================
  BasicScrollView _createActivityTemplateSkeltonArea() =>
      BasicScrollView(children: [
        AppWrap(
            wrapSpacing: 18,
            wrapRunSpacing: 0,
            children: _displayOfferSkeltonListGenerate())
      ]);

  List<Widget> _displayOfferSkeltonListGenerate() =>
      List.generate(3, (index) => const SkeltonOfTraining());

  /// BLOC =============================================================================================================
  BlocBuilder<TrainingOfferDynamicOfferedByCoachBloc,
          TrainingOfferDynamicOfferedByCoachState>
      _bringTrainingOfferFromDatabaseAndDisplayThem(
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit
        chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
          BlocBuilder<TrainingOfferDynamicOfferedByCoachBloc,
              TrainingOfferDynamicOfferedByCoachState>(
            builder: (context, offerState) {
              switch (offerState.status) {
                case StatusWithoutLoading.initial:
                  return _createActivityTemplateSkeltonArea();
                case StatusWithoutLoading.success:
                  if (_checkNoTrainingOffer(offerState)) {
                    return const InformationAboutExisting(
                        detailLabel: 'respond');
                  } else {
                    return _createActivityTypeArea(
                        context,
                        offerState,
                        chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
                        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
                        screenWidth,
                        headlineSmall);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: offerState.error);
              }
            },
          );

  /// CREATE =================================================================================================
  BasicScrollView _createActivityTypeArea(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachState offerState,
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit
        chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
      BasicScrollView(
          controller: _scrollController,
          children: _generateActivityTypeDetails(
              context,
              offerState,
              chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
              trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
              screenWidth,
              headlineSmall));

  /// GENERATE =================================================================================================
  List<Widget> _generateActivityTypeDetails(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachState offerState,
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit
        chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
      List.generate(
          offerState.hasReachedMax == true
              ? offerState.trainingOfferDynamicList.length
              : offerState.trainingOfferDynamicList.length + 1,
          (index) => index >= offerState.trainingOfferDynamicList.length
              ? const BottomLoader()
              : _generateTrainingOfferArea(
                  context,
                  offerState,
                  chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
                  trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
                  screenWidth,
                  index,
                  headlineSmall));

  GestureDetector _generateTrainingOfferArea(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachState offerState,
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit
        chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
    double screenWidth,
    int index,
    TextStyle headlineSmall,
  ) =>
      GestureDetector(
          onTap: () => _goToTrainingOfferResponsePageWithBringingNecessaryBlocs(
              context,
              offerState,
              chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
              trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
              index),
          child: _displayTrainingOfferChoiceColumn(
              context, offerState, screenWidth, index, headlineSmall));

  /// DISPLAY ==========================================================================================================
  CircleImageDetailedChoiceColumn _displayTrainingOfferChoiceColumn(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachState offerState,
    double screenWidth,
    int index,
    TextStyle headlineSmall,
  ) =>
      CircleImageDetailedChoiceColumn(
          additionalSpaceOnBottom: 18,
          textStyle: headlineSmall.copyWith(fontWeight: FontWeight.normal),
          imageWidget: _displayTrainingOfferPhoto(
              context, offerState, screenWidth, index),
          firstLabel: _displayTrainingOfferActivityTitle(offerState, index),
          secondLabel: '');

  Hero _displayTrainingOfferPhoto(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachState offerState,
    double screenWidth,
    int index,
  ) =>
      Hero(
          tag: _heroTag(offerState, index),
          child:
              _displayActivityPicture(context, offerState, screenWidth, index));

  CustomImageContainer _displayActivityPicture(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachState offerState,
    double screenWidth,
    int index,
  ) =>
      CustomImageContainer(
          height: 200,
          width: screenWidth,
          asset: _findTrainingPicture(offerState, index));

  String _displayTrainingOfferActivityTitle(
    TrainingOfferDynamicOfferedByCoachState offerState,
    int index,
  ) =>
      _appFunctions.setWithoutUnderscore(offerState.trainingOfferDynamicList
          .elementAt(index)
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle);

  /// METHODS ==========================================================================================================
  // _deleteTrainingOffer(
  //   BuildContext context,
  //   TrainingOfferDynamicOfferedByCoachState offerState,
  //   ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit
  //       chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
  //   int index,
  // ) {
  //   _assignClickedTrainingOfferAsChosenTrainingOffer(context, offerState,
  //       chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit, index);
  //   showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) {
  //         return TrainingOfferDeletingPopUp();
  //       });
  // }

  void _goToTrainingOfferResponsePageWithBringingNecessaryBlocs(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachState offerState,
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit
        chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
    int index,
  ) {
    _assignClickedTrainingOfferAsChosenTrainingOffer(context, offerState,
        chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit, index);
    _bringTrainingOfferResponseFromDatabase(context, offerState,
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc, index);
    _goToChosenTrainingOfferResponseScreen(context);
  }

  void _bringTrainingOfferResponseFromDatabase(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachState offerState,
    TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc
        trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc,
    int index,
  ) =>
      trainingOfferResponseDynamicWithDistanceByTrainingOfferBloc.add(
          LoadTrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent(
              trainingOfferId: _findChosenTrainingOfferId(offerState, index)));

  void _assignClickedTrainingOfferAsChosenTrainingOffer(
    BuildContext context,
    TrainingOfferDynamicOfferedByCoachState offerState,
    ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit
        chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit,
    int index,
  ) {
    if (kDebugMode) {
      print(
          offerState.trainingOfferDynamicList.elementAt(index).trainingOfferId);
    }
    //
    // BlocProvider.of<
    //             ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit>(
    //         context)
    //     .pressTrainingOffer(OfferState
    //         .trainingOfferDynamicList
    //         .elementAt(index));
    chosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit.pressTrainingOffer(
        offerState.trainingOfferDynamicList.elementAt(index));
  }

  /// Hero Tag ---------------------------------------------------------------------------------------------------------
  String _heroTag(
    TrainingOfferDynamicOfferedByCoachState offerState,
    int index,
  ) =>
      offerState.trainingOfferDynamicList
          .elementAt(index)
          .trainingOfferId
          .toString();

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkNoTrainingOffer(
    TrainingOfferDynamicOfferedByCoachState offerState,
  ) =>
      offerState.trainingOfferDynamicList.isEmpty;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int _findChosenTrainingOfferId(
    TrainingOfferDynamicOfferedByCoachState offerState,
    int index,
  ) =>
      offerState.trainingOfferDynamicList.elementAt(index).trainingOfferId!;

  String _findTrainingPicture(
    TrainingOfferDynamicOfferedByCoachState offerState,
    int index,
  ) =>
      'assets/images/activities/${offerState.trainingOfferDynamicList.elementAt(index).trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg';

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _goToChosenTrainingOfferResponseScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfTrainingOfferResponse.routeName);
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
        if (kDebugMode) {
          print(
              'the lenght of the list is: ${context.read<TrainingOfferDynamicOfferedByCoachBloc>().state.trainingOfferDynamicList.length}');
        }
        context.read<TrainingOfferDynamicOfferedByCoachBloc>().add(
            LoadTrainingOfferDynamicOfferedByCoachEvent(
                coachId: AppNumberConstants().appCoachId,
                offset: context
                    .read<TrainingOfferDynamicOfferedByCoachBloc>()
                    .state
                    .trainingOfferDynamicList
                    .length));
      }
    }
  }
}
