import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/model_dbs.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingDetailsEditingPopUpCancelAndUpdateButtonArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFeedbacks _appFeedbacks = AppFeedbacks();
  final CoachBloc coachBloc;
  final CoachDynamicBloc coachDynamicBloc;

  CoachingDetailsEditingPopUpCancelAndUpdateButtonArea({
    required this.coachBloc,
    required this.coachDynamicBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createButtonArea(context);
  }

  /// CREATE ===========================================================================================================
  CustomColumn _createButtonArea(BuildContext context) =>
      CustomColumn(children: [
        _createCancelAndUpdatedButtonArea(context),
        const CustomAppSizedBox(),
      ]);

  CustomRow _createCancelAndUpdatedButtonArea(BuildContext context) =>
      CustomRow(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(flex: 1, child: _displayCancelButton(context)),
          const CustomAppSizedBox(width: 18),
          Flexible(flex: 1, child: _buildUpdateButton(context)),
        ],
      );

  /// UPDATED BUTTON ===================================================================================================
  /// BUILD ============================================================================================================
  BlocBuilder _buildUpdateButton(BuildContext context) => BlocBuilder<
          TextOfExperienceYearOnCoachingDetailEditingPopUpBloc,
          TextOfExperienceYearOnCoachingDetailEditingPopUpState>(
        builder: (context, state) {
          return BlocBuilder<TextOfMinLessonOnCoachingDetailEditingPopUpBloc,
              TextOfMinLessonOnCoachingDetailEditingPopUpState>(
            builder: (context, state) {
              return BlocBuilder<
                  TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc,
                  TextOfPerLessonPriceOnCoachingDetailEditingPopUpState>(
                builder: (context, state) {
                  return _displayUpdatedButton(context);
                },
              );
            },
          );
        },
      );

  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayUpdatedButton(BuildContext context) =>
      CustomElevatedButton(
        buttonColor: _appColors.secondary,
        textlabel: 'Update',
        onPressed: _checkWhetherExperienceIsUpdated(context) ||
                _checkWhetherMinLessonIsUpdated(context) ||
                _checkWhetherPerLessonPriceIsUpdated(context)
            ? () {
                _clickUpdateButton(context);
              }
            : null,
      );

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherExperienceIsUpdated(BuildContext context) =>
      (_findTextOfExperienceYear(context) !=
              _findCoachExperienceYear(context) &&
          _findTextfieldOfExperience(context) !=
              _findCoachExperienceYear(context));

  bool _checkWhetherMinLessonIsUpdated(BuildContext context) =>
      (_findTextOfMinLesson(context) != _findCoachMinLesson(context) &&
          _findTextfieldOfMinLesson(context) != _findCoachMinLesson(context));

  bool _checkWhetherPerLessonPriceIsUpdated(BuildContext context) =>
      (_findTextOfPerLessonPrice(context) !=
              _findCoachPerLessonPrice(context) &&
          _findTextfieldOfPerLessonPrice(context) !=
              _findCoachPerLessonPrice(context));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String? _findTextOfExperienceYear(BuildContext context) => context
      .read<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
      .state
      .experienceYear;

  String _findCoachExperienceYear(BuildContext context) => context
      .read<CoachBloc>()
      .state
      .coachList
      .last
      .coachingExperience
      .experienceYear;

  String? _findTextfieldOfExperience(BuildContext context) => context
      .read<DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
      .state
      .fieldText;

  String _findTextOfMinLesson(BuildContext context) => context
      .read<TextOfUsernameOnPersonalDetailEditingPopUpBloc>()
      .state
      .username!;

  String _findTextfieldOfMinLesson(BuildContext context) => context
      .read<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc>()
      .state
      .fieldText!;

  String _findTextOfPerLessonPrice(BuildContext context) => context
      .read<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
      .state
      .perLessonPrice!;

  String _findTextfieldOfPerLessonPrice(BuildContext context) => context
      .read<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
      .state
      .fieldText!;

  /// METHODS ==========================================================================================================
  void _clickUpdateButton(BuildContext context) {
    if (_checkExperienceYearIsNotChosen(context)) {
      _displayDialogAboutDeficientExperienceYear(context);
    } else if (_checkMinLessonNotFilledUp(context)) {
      _displayDialogAboutDeficientMinLesson(context);
    } else if (_checkPerLessonPriceNotFilledUp(context)) {
      _displayDialogAboutPerLessonPrice(context);
    } else {
      _startUpdatingProcess(context);
    }
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  bool _checkExperienceYearIsNotChosen(BuildContext context) =>
      context
          .read<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
          .state
          .experienceYear ==
      '';

  bool _checkMinLessonNotFilledUp(BuildContext context) =>
      context
          .read<TextOfMinLessonOnCoachingDetailEditingPopUpBloc>()
          .state
          .minLesson ==
      '';

  bool _checkPerLessonPriceNotFilledUp(BuildContext context) =>
      context
          .read<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
          .state
          .perLessonPrice ==
      '';

  /// Display Dialogs --------------------------------------------------------------------------------------------------
  Future<dynamic> _displayDialogAboutDeficientExperienceYear(
          BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyExperienceYear);

  Future<dynamic> _displayDialogAboutDeficientMinLesson(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyMinLesson);

  Future<dynamic> _displayDialogAboutPerLessonPrice(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyPerLessonPrice);

  /// UPDATING PROCESS -------------------------------------------------------------------------------------------------
  void _startUpdatingProcess(BuildContext context) {
    _bringChosenCoachingExperienceDetailFromDB(context);
    showDialog(
        context: context,
        builder: (context) {
          return BlocListener<CoachingExperienceDynamicByChosenAttributesBloc,
              CoachingExperienceDynamicByChosenAttributesState>(
            listenWhen: (previous, current) =>
                _checkWhetherCoachingExperienceUpdatingSuccessfully(current),
            listener: (context, state) {
              _initiateUpdatingProcess(context, coachBloc, coachDynamicBloc);
              // _cleanAllButton(context);
              int pageCount = 0;
              Future.delayed(AppTimeConstants().timeOutDuration, () {
                _closeUpdatingPopUp(context, pageCount);
              });
            },
            child: BlocBuilder<CoachingExperienceDynamicByChosenAttributesBloc,
                CoachingExperienceDynamicByChosenAttributesState>(
              builder: (context, state) {
                switch (state.status) {
                  case Status.initial:
                    return DBProcessLoader();
                  case Status.loading:
                    return DBProcessLoader();
                  case Status.success:
                    return DBProcessLoader();
                  case Status.failure:
                    return StateError(error: state.error);
                }
              },
            ),
          );
        });
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherCoachingExperienceUpdatingSuccessfully(
          CoachingExperienceDynamicByChosenAttributesState current) =>
      current.status == Status.success;

  /// Initiate Process Method ------------------------------------------------------------------------------------------
  void _initiateUpdatingProcess(
    BuildContext context,
    CoachBloc coachBloc,
    CoachDynamicBloc coachDynamicBloc,
  ) {
    CoachDB coachDB = _createCoachDBInstance(context);
    _updateCoachIntoDB(context, coachDB);
    _changeCoachState(context, coachBloc, coachDynamicBloc);
    _bringCoachFromDB(context);
    // ? The below code block relocated up in BlocListener because the otherwise (just for a while but still) gave an error and empty template information!!!
    // _cleanAllButton(context);
    // int pageCount = 0;
    // _closeAddingPopUp(context, pageCount);
  }

  /// State Changing Methods -------------------------------------------------------------------------------------------
  void _changeCoachState(
    BuildContext context,
    CoachBloc coachBloc,
    CoachDynamicBloc coachDynamicBloc,
  ) {
    coachBloc.add(RecallCoachEvent());
    coachDynamicBloc.add(RecallCoachDynamicEvent());
    // context.read<CoachBloc>().add(RecallCoachEvent());
    // context.read<CoachDynamicBloc>().add(RecallCoachDynamicEvent());
  }

  /// Create Model Instance --------------------------------------------------------------------------------------------
  CoachDB _createCoachDBInstance(BuildContext context) {
    final CoachDB coachDB = CoachDB(
      coachId: _findCoachId,
      userId: _findUserId,
      coachingTypeId: _findCoachingTypeId(context),
      coachingExperienceId: _findCoachingExperienceId(context),
      perLessonPrice: _findPerLessonPrice(context),
      minLesson: _findMinLesson(context),
      updatedAt: DateTime.now(),
      isActive: true,
    );
    return coachDB;
  }

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int get _findUserId => _appNumberConstants.appUserId;

  int _findCoachingTypeId(BuildContext context) => context
      .read<CoachDynamicBloc>()
      .state
      .coachDynamicList
      .last
      .coachingTypeDynamic
      .coachingTypeId!;

  int _findCoachingExperienceId(BuildContext context) => context
      .read<CoachingExperienceDynamicByChosenAttributesBloc>()
      .state
      .coachingExperienceDynamicList
      .last
      .coachingExperienceId!;

  int _findPerLessonPrice(BuildContext context) => int.parse(context
      .read<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
      .state
      .perLessonPrice!);

  int _findMinLesson(BuildContext context) => int.parse(context
      .read<TextOfMinLessonOnCoachingDetailEditingPopUpBloc>()
      .state
      .minLesson!);

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _updateCoachIntoDB(BuildContext context, CoachDB coachDB) {
    context.read<CoachDBBloc>().add(UpdateCoachDBEvent(coachDB: coachDB));
  }

  void _bringCoachFromDB(
    BuildContext context,
    // CoachBloc coachBloc,
    // CoachDynamicBloc coachDynamicBloc,
  ) {
    // coachBloc.add(LoadCoachEvent(coachId: _findCoachId));
    // coachDynamicBloc.add(LoadCoachDynamicEvent(coachId: _findCoachId));
    context.read<CoachBloc>().add(LoadCoachEvent(coachId: _findCoachId));
    context
        .read<CoachDynamicBloc>()
        .add(LoadCoachDynamicEvent(coachId: _findCoachId));
  }

  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayCancelButton(BuildContext context) =>
      CustomElevatedButton(
          buttonColor: _appColors.unselectedButtonColor,
          textlabel: 'Cancel',
          onPressed: () {
            _clickCancelButton(context);
          });

  /// METHODS ==========================================================================================================
  /// Cancel Button ----------------------------------------------------------------------------------------------------
  void _clickCancelButton(BuildContext context) {
    if (_checkExperienceYearIsChosen(context)) {
      _submitExperienceYearField(context);
    }
    if (_checkMinLessonFilledUp(context)) {
      _submitMinLessonField(context);
    }
    if (_checkPerLessonPriceFilledUp(context)) {
      _submitPerLessonPriceField(context);
    }
    _closePopUp(context);
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkExperienceYearIsChosen(
    BuildContext context,
  ) =>
      context
          .read<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
          .state
          .experienceYear !=
      '';

  bool _checkMinLessonFilledUp(BuildContext context) =>
      context
          .read<TextOfMinLessonOnCoachingDetailEditingPopUpBloc>()
          .state
          .minLesson !=
      '';

  bool _checkPerLessonPriceFilledUp(BuildContext context) =>
      context
          .read<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
          .state
          .perLessonPrice !=
      '';

  /// Submit method ----------------------------------------------------------------------------------------------------
  void _submitExperienceYearField(BuildContext context) {
    context.read<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc>().add(
        (TextOfExperienceYearOnCoachingDetailEditingPopUpSubmit(
            _findCoachingExperinceYear(context))));
    context
        .read<DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
        .add(DropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit(
            _findCoachingExperinceYear(context)));
  }

  void _submitMinLessonField(BuildContext context) {
    context.read<TextOfMinLessonOnCoachingDetailEditingPopUpBloc>().add(
        (TextOfMinLessonOnCoachingDetailEditingPopUpSubmit(
            _findCoachMinLesson(context).toString())));
    context.read<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc>().add(
        TextFieldOfMinLessonOnCoachingDetailEditingPopUpSubmit(
            context.read<CoachBloc>().state.coachList.last.minLesson));
  }

  void _submitPerLessonPriceField(BuildContext context) {
    context.read<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>().add(
        (TextOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(
            _findCoachPerLessonPrice(context))));
    context
        .read<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>()
        .add(TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(
            context.read<CoachBloc>().state.coachList.last.perLessonPrice));
  }

  // void _cleanAllButton(BuildContext context) {
  //   _submitExperienceYearField(context);
  //   _submitMinLessonField(context);
  //   _submitPerLessonPriceField(context);
  // }
  /// GENERAL METHODS ==================================================================================================
  /// Get Methods ------------------------------------------------------------------------------------------------------
  int getExperienceYear(BuildContext context) => context
      .read<CoachingExperienceDynamicBloc>()
      .state
      .coachingExperienceDynamicList
      .where((element) =>
          element.experienceYear == _chosenExperienceYearDetail(context))
      .first
      .coachingExperienceId!;

  /// Chosen Methods ---------------------------------------------------------------------------------------------------
  String _chosenExperienceYearDetail(BuildContext context) => context
      .read<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc>()
      .state
      .experienceYear!;

  /// Find Mehtods -----------------------------------------------------------------------------------------------------
  int get _findCoachId => _appNumberConstants.appCoachId;

  String _findCoachingExperinceYear(BuildContext context) => context
      .read<CoachBloc>()
      .state
      .coachList
      .last
      .coachingExperience
      .experienceYear;

  String _findCoachMinLesson(BuildContext context) =>
      context.read<CoachBloc>().state.coachList.last.minLesson.toString();

  String _findCoachPerLessonPrice(BuildContext context) =>
      context.read<CoachBloc>().state.coachList.last.perLessonPrice.toString();

  /// SHOW DIALOGS =====================================================================================================
  /// This function is showing Dialog about missing selection. [alertLabel] is information about the subject of the
  /// alert. [_createShowDialogAboutSelection] funcition returns [SelectionAlertDialog] widget which is local
  /// widget. In case the widget needs somewhere in app, it will be moved to general widget file.
  Future<dynamic> _createShowDialogAboutSelection(
    BuildContext context,
    String alertLabel,
  ) =>
      showDialog(
          context: context,
          builder: (_) => SelectionAlertDialog(alertLabel: alertLabel));

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _bringChosenCoachingExperienceDetailFromDB(BuildContext context) {
    context
        .read<CoachingExperienceDynamicByChosenAttributesBloc>()
        .add(LoadCoachingExperienceDynamicByChosenAttributesEvent(
          coachingExperienceYearId: getExperienceYear(context),
        ));
  }

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _closeUpdatingPopUp(BuildContext context, int pageCount) {
    Navigator.of(context).popUntil((_) => pageCount++ >= 2);
  }

  void _closePopUp(BuildContext context) => Navigator.of(context).pop();
}
