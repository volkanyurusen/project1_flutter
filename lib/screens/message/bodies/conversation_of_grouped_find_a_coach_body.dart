import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/screens/message/local_widgets/zlocal_widget.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class ConversationOfGroupedFindACoachBody extends StatefulWidget {
  final double screenWidth;

  const ConversationOfGroupedFindACoachBody({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  State<ConversationOfGroupedFindACoachBody> createState() =>
      _ConversationOfGroupedFindACoachBodyState();
}

class _ConversationOfGroupedFindACoachBodyState
    extends State<ConversationOfGroupedFindACoachBody> {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit =
        context.read<GroupedFindACoachConversationDynamicByTraineeCubit>();

    return _bringFindACoachConversationByConversationFromDatabaseAndDisplayThem(
        groupedFindACoachConversationDynamicByTraineeCubit);
  }

  /// BLOC =============================================================================================================
  BlocBuilder
      _bringFindACoachConversationByConversationFromDatabaseAndDisplayThem(
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
  ) =>
          BlocBuilder<FindACoachConversationDynamicByTraineeBloc,
              FindACoachConversationDynamicByTraineeState>(
            builder: (context, state) {
              List<int?> uniqueListOfActivityNameId = <int?>[];
              _createUniqueListOfActivityNameId(
                  state, uniqueListOfActivityNameId);
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return const StateLoading();
                case StatusWithoutLoading.success:
                  if (_checkWhetherThereIsAnyFindACoach(state)) {
                    return _createInformationAreaOfEmptyConversation();
                  } else {
                    return _createAppBody(
                        context,
                        state,
                        groupedFindACoachConversationDynamicByTraineeCubit,
                        uniqueListOfActivityNameId);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  /// CREATE ===========================================================================================================
  InformationAboutExisting _createInformationAreaOfEmptyConversation() =>
      const InformationAboutExisting(detailLabel: 'conversation');

  AppBody _createAppBody(
    BuildContext context,
    FindACoachConversationDynamicByTraineeState state,
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
    List<int?> uniqueListOfActivityNameId,
  ) =>
      AppBody(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: AppWrap(
            wrapRunSpacing: 18,
            wrapSpacing: 18,
            children: _generateFindACoachConversationColumn(
              context,
              state,
              groupedFindACoachConversationDynamicByTraineeCubit,
              uniqueListOfActivityNameId,
            ),
          ),
        ),
      );

  /// GENERATE =========================================================================================================
  List<Widget> _generateFindACoachConversationColumn(
    BuildContext context,
    FindACoachConversationDynamicByTraineeState state,
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
    List<int?> uniqueListOfActivityNameId,
  ) =>
      List.generate(
          state.hasReachedMax
              ? uniqueListOfActivityNameId.length
              : uniqueListOfActivityNameId.length + 1,
          (index) => index >= uniqueListOfActivityNameId.length
              ? const BottomLoader()
              : _displayMessageResponseBoxWithPaddingArea(
                  context,
                  state,
                  groupedFindACoachConversationDynamicByTraineeCubit,
                  uniqueListOfActivityNameId,
                  index));

  /// DISPLAY ==========================================================================================================
  Padding _displayMessageResponseBoxWithPaddingArea(
    BuildContext context,
    FindACoachConversationDynamicByTraineeState state,
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      Padding(
        padding: index < 2
            ? const EdgeInsets.only(top: 18)
            : const EdgeInsets.only(top: 0),
        child: _displayResponseBoxes(
            context,
            state,
            groupedFindACoachConversationDynamicByTraineeCubit,
            uniqueListOfActivityNameId,
            index),
      );

  CoachingMessageResponseContainer _displayResponseBoxes(
    BuildContext context,
    FindACoachConversationDynamicByTraineeState state,
    GroupedFindACoachConversationDynamicByTraineeCubit
        groupedFindACoachConversationDynamicByTraineeCubit,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      CoachingMessageResponseContainer(
        screenWidth: widget.screenWidth,
        imageUrl:
            _displayActivityImage(state, uniqueListOfActivityNameId, index),
        activityTitle:
            _displayActivityTitle(state, uniqueListOfActivityNameId, index),
        responseNumber:
            _displayOfferNumber(state, uniqueListOfActivityNameId, index),
        typeOfContainer: 'request',
        onTap: () {
          //
          // print(_appFunctions.setWithoutUnderscore(
          //     _findUniqueActivityTitle(state, uniqueListOfActivityNameId, index)
          //         .toList()
          //         .toString()));
          groupedFindACoachConversationDynamicByTraineeCubit
              .pressFindACoachConversation(state
                  .findACoachConversationDynamicList
                  .where((element) =>
                      element
                          .trainingOfferResponseDynamic
                          .trainingOfferDynamic
                          .trainingDetailDynamic
                          .activityNameDynamic
                          .activityNameId ==
                      uniqueListOfActivityNameId.elementAt(index))
                  .toList());
          context
              .read<
                  FindACoachMessageDynamicByGroupOfFindACoachConversationBloc>()
              .add(
                  LoadFindACoachMessageDynamicByGroupOfFindACoachConversationEvent(
                      traineeId: _appNumberConstants.appUserId,
                      findACoachConversationList: state
                          .findACoachConversationDynamicList
                          .where((element) =>
                              element
                                  .trainingOfferResponseDynamic
                                  .trainingOfferDynamic
                                  .trainingDetailDynamic
                                  .activityNameDynamic
                                  .activityNameId ==
                              uniqueListOfActivityNameId.elementAt(index))
                          .map((e) => e.trainingOfferConversationId)
                          .toList()));
          //
          // context.read<FindACoachMessageDynamicByGroupOfFindACoachConversationBloc>().add(
          //     LoadFindACoachMessageDynamicByGroupOfFindACoachConversationEvent(
          //         traineeId: AppNumberConstants().appUserId,
          //         findACoachConversationList: state
          //             .findACoachConversationDynamicList
          //             .map((e) => e.trainingOfferConversationId)
          //             .toList()));
          _goToScreenOfConversationOfFindACoach(context);
        },
      );

  String _displayActivityImage(
    FindACoachConversationDynamicByTraineeState state,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      'assets/images/activities/${_findUniqueActivityTitle(state, uniqueListOfActivityNameId, index).first.trainingOfferResponseDynamic.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg';

  String _displayActivityTitle(
    FindACoachConversationDynamicByTraineeState state,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      _findUniqueActivityTitle(state, uniqueListOfActivityNameId, index)
          .first
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityTitle;

  String _displayOfferNumber(
    FindACoachConversationDynamicByTraineeState state,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      _findUniqueActivityTitle(state, uniqueListOfActivityNameId, index)
          .toList()
          .length
          .toString();

  /// METHOD ===========================================================================================================
  void _createUniqueListOfActivityNameId(
      FindACoachConversationDynamicByTraineeState state,
      List<int?> uniqueListOfActivityNameId) {
    for (var element in state.findACoachConversationDynamicList) {
      if (uniqueListOfActivityNameId.contains(element
          .trainingOfferResponseDynamic
          .trainingOfferDynamic
          .trainingDetailDynamic
          .activityNameDynamic
          .activityNameId)) {
      } else {
        uniqueListOfActivityNameId.add(element
            .trainingOfferResponseDynamic
            .trainingOfferDynamic
            .trainingDetailDynamic
            .activityNameDynamic
            .activityNameId);
      }
    }
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherThereIsAnyFindACoach(
    FindACoachConversationDynamicByTraineeState state,
  ) =>
      state.findACoachConversationDynamicList.isEmpty;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  Iterable<TrainingOfferConversationDynamic> _findUniqueActivityTitle(
    FindACoachConversationDynamicByTraineeState state,
    List<int?> uniqueListOfActivityNameId,
    int index,
  ) =>
      state.findACoachConversationDynamicList.where((element) =>
          element.trainingOfferResponseDynamic.trainingOfferDynamic
              .trainingDetailDynamic.activityNameDynamic.activityNameId ==
          uniqueListOfActivityNameId.elementAt(index));

  /// Screen Methods ---------------------------------------------------------------------------------------------------
  void _goToScreenOfConversationOfFindACoach(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfConversationOfFindACoach.routeName);
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
        //
        // if (kDebugMode) {
        //   print(
        //       'the lenght of the list is: ${context.read<FindACoachConversationDynamicByTraineeBloc>().state.findACoachConversationDynamicList.length}');
        // }
        List<int?> uniqueActivityNameIdList = <int?>[];
        for (var element in context
            .read<FindACoachConversationDynamicByTraineeBloc>()
            .state
            .findACoachConversationDynamicList) {
          if (uniqueActivityNameIdList.contains(element
              .trainingOfferResponseDynamic
              .trainingOfferDynamic
              .trainingDetailDynamic
              .activityNameDynamic
              .activityNameId)) {
          } else {
            uniqueActivityNameIdList.add(element
                .trainingOfferResponseDynamic
                .trainingOfferDynamic
                .trainingDetailDynamic
                .activityNameDynamic
                .activityNameId);
          }
        }
        context.read<FindACoachConversationDynamicByTraineeBloc>().add(
            LoadFindACoachConversationDynamicByTraineeEvent(
                traineeId: _appNumberConstants.appUserId,
                offset: uniqueActivityNameIdList.length));
      }
    }
  }
}
