// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class LocationTemplateDeletingPopUp extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();
  final LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc;

  LocationTemplateDeletingPopUp({
    required this.locationTemplateDynamicByUserBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionPopUp(
        actionVoidCallBack: () {
          _deleteTemplateIntoDBCleanAllChosenButtonAndCloseUpdatingPopUp(
              context, locationTemplateDynamicByUserBloc);
        },
        cancelVoidCallBack: () {});
  }

  // METHODS ==========================================================================================================
  void _deleteTemplateIntoDBCleanAllChosenButtonAndCloseUpdatingPopUp(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) {
    _deleteNewLocationTemplateIntoDB(context);
    _displayTemplateUpdatingDialog(context, locationTemplateDynamicByUserBloc);
  }

  // DISPLAY ===========================================================================================================
  Future<dynamic> _displayTemplateUpdatingDialog(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _listenDeleteTemplateFromDB(
                locationTemplateDynamicByUserBloc);
          });

  // LISTEN ============================================================================================================
  BlocListener<LocationTemplateBloc, LocationTemplateState>
      _listenDeleteTemplateFromDB(
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) =>
          BlocListener<LocationTemplateBloc, LocationTemplateState>(
            listenWhen: (previous, current) =>
                _checkWhetherTemplateUpdatingSuccessfully(current),
            listener: (context, state) {
              _recallLocationTemplateDynamicByUserFromDB(
                  context, locationTemplateDynamicByUserBloc);
            },
            child: _buildDeleteMethod(),
          );

  // METHODS ===========================================================================================================
  void _recallLocationTemplateDynamicByUserFromDB(BuildContext context,
      LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc) {
    _changeLocationTemplateDynamicByUserState(
        locationTemplateDynamicByUserBloc);
    _bringLocationTemplateDynamicByUserFromDB(
        locationTemplateDynamicByUserBloc);
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherTemplateUpdatingSuccessfully(
          LocationTemplateState current) =>
      current.status == Status.success;

  // BUILD =============================================================================================================
  BlocBuilder<LocationTemplateBloc, LocationTemplateState>
      _buildDeleteMethod() =>
          BlocBuilder<LocationTemplateBloc, LocationTemplateState>(
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
  int _findLocationTemplateId(BuildContext context) => context
      .read<
          ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit>()
      .state
      .chosenLocationTemplateDynamicList
      .last
      .locationTemplateId!;

  // State Changing Methods --------------------------------------------------------------------------------------------
  void _changeLocationTemplateDynamicByUserState(
      LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc) {
    locationTemplateDynamicByUserBloc
        .add(RecallLocationTemplateDynamicByUserEvent());
  }

  void _deleteNewLocationTemplateIntoDB(BuildContext context) {
    context.read<LocationTemplateBloc>().add(DeleteLocationTemplateEvent(
        locationTemplateId: _findLocationTemplateId(context)));
  }

  void _bringLocationTemplateDynamicByUserFromDB(
      LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc) {
    locationTemplateDynamicByUserBloc.add(
        LoadLocationTemplateDynamicByUserEvent(
            uId: _appNumberConstants.appUserId));
  }

  // Screen Method -----------------------------------------------------------------------------------------------------
  void _closeUpdatingPopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 2);
  }
}
