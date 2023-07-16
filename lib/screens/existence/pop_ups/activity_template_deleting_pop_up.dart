// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityTemplateDeletingPopUp extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();
  final ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc;

  ActivityTemplateDeletingPopUp({
    required this.activityTemplateDynamicByUserBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionPopUp(
        actionVoidCallBack: () {
          _deleteTemplateIntoDBCleanAllChosenButtonAndCloseUpdatingPopUp(
              context, activityTemplateDynamicByUserBloc);
        },
        cancelVoidCallBack: () {});
  }

  // METHODS ===========================================================================================================
  void _deleteTemplateIntoDBCleanAllChosenButtonAndCloseUpdatingPopUp(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) {
    _deleteActivityTemplateFromDB(context);
    _displayTemplateUpdatingDialog(context, activityTemplateDynamicByUserBloc);
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayTemplateUpdatingDialog(
          BuildContext context,
          ActivityTemplateDynamicByUserBloc
              activityTemplateDynamicByUserBloc) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _listenDeleteTemplateFromDB(
                activityTemplateDynamicByUserBloc);
          });

  // LISTEN ============================================================================================================
  BlocListener<ActivityTemplateBloc, ActivityTemplateState>
      _listenDeleteTemplateFromDB(
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) =>
          BlocListener<ActivityTemplateBloc, ActivityTemplateState>(
            listenWhen: (previous, current) =>
                _checkWhetherTemplateUpdatingSuccessfully(current),
            listener: (context, state) {
              _recallActivityTemplateDynamicByUserFromDB(
                  context, activityTemplateDynamicByUserBloc);
            },
            child: _buildDeleteMethod(),
          );

  // METHODS ===========================================================================================================
  void _recallActivityTemplateDynamicByUserFromDB(BuildContext context,
      ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc) {
    _changeActivityTemplateDynamicByUserState(
        activityTemplateDynamicByUserBloc);
    _bringActivityTemplateDynamicByUserFromDB(
        activityTemplateDynamicByUserBloc);
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherTemplateUpdatingSuccessfully(
          ActivityTemplateState current) =>
      current.status == Status.success;

  // BUILD =============================================================================================================
  BlocBuilder<ActivityTemplateBloc, ActivityTemplateState>
      _buildDeleteMethod() =>
          BlocBuilder<ActivityTemplateBloc, ActivityTemplateState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return DBProcessLoader();
                case Status.loading:
                  return DBProcessLoader();
                case Status.success:
                  Future.delayed(_appTimeConstants.timeOutDuration, () {
                    _closeUpdatingPopUp(context);
                  });
                  return const LoadSuccessfullyAlertDialog(
                      content: 'The chosen template has been deleted');
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          );

  // METHODS ===========================================================================================================
  // Find Mehtods ------------------------------------------------------------------------------------------------------
  int _findActivityTemplateId(BuildContext context) => context
      .read<
          ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpCubit>()
      .state
      .chosenActivityTemplateList
      .last
      .activityTemplateId!;

  // State Changing Methods --------------------------------------------------------------------------------------------
  void _changeActivityTemplateDynamicByUserState(
      ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc) {
    activityTemplateDynamicByUserBloc
        .add(RecallActivityTemplateDynamicByUserEvent());
  }

  void _deleteActivityTemplateFromDB(BuildContext context) {
    context.read<ActivityTemplateBloc>().add(DeleteActivityTemplateEvent(
        activityTemplateId: _findActivityTemplateId(context)));
  }

  void _bringActivityTemplateDynamicByUserFromDB(
      ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc) {
    activityTemplateDynamicByUserBloc.add(
        LoadActivityTemplateDynamicByUserEvent(
            uId: _appNumberConstants.appUserId));
  }

  // Screen Method -----------------------------------------------------------------------------------------------------
  void _closeUpdatingPopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 2);
  }
}
