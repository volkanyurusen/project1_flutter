import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenUserTypeDetailArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final AppListConstants _appListConstants = AppListConstants();

  ChosenUserTypeDetailArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bodyWidth = MediaQuery.of(context).size.width;
    Color whiteColor = _appColors.scaffoldBackgroundColor;
    Color primaryColor = _appColors.primary;
    TextStyle? titleStyle =
        Theme.of(context).textTheme.displayLarge!.copyWith(color: whiteColor);
    TextStyle? detailStyle =
        Theme.of(context).textTheme.titleSmall!.copyWith(color: whiteColor);
    TextStyle enabledButtonLabelStyle = context.textTheme.headlineMedium!
        .copyWith(color: _appColors.scaffoldBackgroundColor);
    TextStyle disabledButtonLabelStyle = context.textTheme.headlineMedium!
        .copyWith(
            color: _appColors.scaffoldBackgroundColor
                .withBlue(5)
                .withGreen(5)
                .withRed(5)
                .withOpacity(0.5));

    return _buildChosenUserTypeDetailColumn(
        bodyWidth,
        whiteColor,
        primaryColor,
        titleStyle,
        detailStyle,
        enabledButtonLabelStyle,
        disabledButtonLabelStyle);
  }

  // CHOSEN USER TYPE DETAIL COLUMN ====================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<ChosenMembershipTypeCubit, ChosenMembershipTypeState>
      _buildChosenUserTypeDetailColumn(
    double bodyWidth,
    Color whiteColor,
    Color primaryColor,
    TextStyle titleStyle,
    TextStyle detailStyle,
    TextStyle enabledButtonLabelStyle,
    TextStyle disabledButtonLabelStyle,
  ) =>
          BlocBuilder<ChosenMembershipTypeCubit, ChosenMembershipTypeState>(
              builder: (context, state) {
            if (state.chosenMembershipTypeList.isEmpty) {
              return NothingReturned();
            } else {
              return _createChosenUserTypeDetailColumn(
                  context,
                  state,
                  bodyWidth,
                  primaryColor,
                  whiteColor,
                  titleStyle,
                  detailStyle,
                  enabledButtonLabelStyle,
                  disabledButtonLabelStyle);
            }
          });

  // CHOSEN USER TYPE DETAIL COLUMN ====================================================================================
  // CREATE ============================================================================================================
  ChosenTypeColumn _createChosenUserTypeDetailColumn(
    BuildContext context,
    ChosenMembershipTypeState state,
    double bodyWidth,
    Color primaryColor,
    Color whiteColor,
    TextStyle titleStyle,
    TextStyle detailStyle,
    TextStyle enabledButtonLabelStyle,
    TextStyle disabledButtonLabelStyle,
  ) =>
      ChosenTypeColumn(
        color: _checkWhetherMembershipTypeIsBasic(state)
            ? _appColors.textColor
            : primaryColor,
        screenWidth: bodyWidth,
        children: [
          _createTypeNameAndIconArea(whiteColor, state, titleStyle),
          _createDetailTitleIconAndContentArea(state, whiteColor, detailStyle),
          _createMonthlyPriceAndSubscribeButtonArea(context, state, titleStyle,
              enabledButtonLabelStyle, disabledButtonLabelStyle),
        ],
      );

  // TYPE TITLE AREA ===================================================================================================
  // CREATE ============================================================================================================
  Row _createTypeNameAndIconArea(Color whiteColor,
          ChosenMembershipTypeState state, TextStyle titleStyle) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _displayTypeCardIcon(state),
          const CustomAppSizedBox(width: 10),
          _displayTypeCardName(state, titleStyle),
        ],
      );

  // DISPLAY ===========================================================================================================
  AppHeaderText _displayTypeCardName(
          ChosenMembershipTypeState state, TextStyle titleStyle) =>
      AppHeaderText(
          textLabel: _findMembershipTypeName(state), textStyle: titleStyle);

  TypeCardTypeIcon _displayTypeCardIcon(ChosenMembershipTypeState state) =>
      TypeCardTypeIcon(child: _displayCorrectTypeCardIcon(state));

  Icon _displayCorrectTypeCardIcon(ChosenMembershipTypeState state) =>
      _appListConstants.typeIcon
          .elementAt(_checkWhetherMembershipTypeIsBasic(state) ? 0 : 1);

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findMembershipTypeName(ChosenMembershipTypeState state) =>
      state.chosenMembershipTypeList.last.membershipTypeName;

  // TITLE AND ICON AREA ===============================================================================================
  // CREATE ============================================================================================================
  CustomColumn _createDetailTitleIconAndContentArea(
    ChosenMembershipTypeState state,
    Color whiteColor,
    TextStyle detailStyle,
  ) =>
      CustomColumn(
          children: _generateDetailTitleIconAndContentArea(
              state, whiteColor, detailStyle));

  // GENERATE ==========================================================================================================
  List<Widget> _generateDetailTitleIconAndContentArea(
    ChosenMembershipTypeState state,
    Color whiteColor,
    TextStyle detailStyle,
  ) =>
      List.generate(
        _appListConstants.platinumMembershipTypeValue.length,
        (index) => AppHeader(
          spaceFromUpperWidget: index == 0 ? 0 : 5,
          firstWidget: _createDetailTitleAndIconArea(
              state, index, whiteColor, detailStyle),
          thirdWidget: _displayContent(state, index, detailStyle),
        ),
      );

  // ICONS AND DETAIL AREA =============================================================================================
  // CREATE ===========================================================================================================
  AppHeader _createDetailTitleAndIconArea(ChosenMembershipTypeState state,
          int index, Color whiteColor, TextStyle detailStyle) =>
      AppHeader(
        firstWidget: _displayCorrectIcon(state, index, whiteColor),
        secondWidget: const CustomAppSizedBox(width: 5),
        thirdWidget: _displayDetailTitle(state, index, detailStyle),
      );

  // ICONS =============================================================================================================
  // DISPLAY ===========================================================================================================
  Icon _displayCorrectIcon(
    ChosenMembershipTypeState state,
    int index,
    Color whiteColor,
  ) =>
      _toJsonChosenMembershipTypeDetail(state)
                  .entries
                  .elementAt(index + 2)
                  .value ==
              true
          ? _displayIncludedIcon(whiteColor)
          : _toJsonChosenMembershipTypeDetail(state)
                      .entries
                      .elementAt(index + 2)
                      .value ==
                  false
              ? _displayExcludedIcon(whiteColor)
              : _toJsonChosenMembershipTypeDetail(state)
                          .entries
                          .elementAt(index + 2)
                          .value ==
                      0
                  ? _displayExcludedIcon(whiteColor)
                  : _displayIncludedIcon(whiteColor);

  Icon _displayIncludedIcon(Color whiteColor) =>
      Icon(Icons.done_sharp, color: whiteColor, size: 18);

  Icon _displayExcludedIcon(Color whiteColor) =>
      Icon(Icons.clear_sharp, color: whiteColor, size: 18);

  // METHODS ===========================================================================================================
  // ToJson Methods ----------------------------------------------------------------------------------------------------
  Map<String, dynamic> _toJsonChosenMembershipTypeDetail(
          ChosenMembershipTypeState state) =>
      state.chosenMembershipTypeList.last.toJson();

  // DETAIL TITLE ======================================================================================================
  // DISPLAY ===========================================================================================================
  AppHeaderText _displayDetailTitle(
    ChosenMembershipTypeState state,
    int index,
    TextStyle detailStyle,
  ) =>
      AppHeaderText(
          textLabel: _findDetailTitleText(state, index).toCapitalized(),
          textStyle: detailStyle);

  // METHODS ===========================================================================================================
  // Bring Methods -----------------------------------------------------------------------------------------------------
  String _bringKeyOfMembershipTypeOfUser(
          ChosenMembershipTypeState state, int index) =>
      _toJsonChosenMembershipTypeDetail(state).entries.elementAt(index + 2).key;

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findDetailTitleText(ChosenMembershipTypeState state, int index) =>
      _appFunctions
          .setWithoutUnderscore(_bringKeyOfMembershipTypeOfUser(state, index));

  /// DETAIL TITLE CONTENT AREA ========================================================================================
  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayContent(
          ChosenMembershipTypeState state, int index, TextStyle detailStyle) =>
      AppHeaderText(
          textLabel: _findContentText(state, index), textStyle: detailStyle);

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findContentText(ChosenMembershipTypeState state, int index) =>
      _toJsonChosenMembershipTypeDetail(state)
                  .entries
                  .elementAt(index + 2)
                  .value ==
              true
          ? 'Included'
          : _toJsonChosenMembershipTypeDetail(state)
                      .entries
                      .elementAt(index + 2)
                      .value ==
                  false
              ? 'Excluded'
              : _toJsonChosenMembershipTypeDetail(state)
                          .entries
                          .elementAt(index + 2)
                          .value ==
                      0
                  ? 'None'
                  : state.chosenMembershipTypeList.last.membershipTypeName ==
                          'Basic User'
                      ? _toJsonChosenMembershipTypeDetail(state)
                              .entries
                              .elementAt(index + 2)
                              .value
                              .toString() +
                          _appListConstants.basicMembershipTypeValue
                              .elementAt(index)
                      : _toJsonChosenMembershipTypeDetail(state)
                              .entries
                              .elementAt(index + 2)
                              .value
                              .toString() +
                          _appListConstants.platinumMembershipTypeValue
                              .elementAt(index);

  // MONTHLY PRICE AND SUBSCRIBE BUTTON AREA ===========================================================================
  // CREATE ============================================================================================================
  Row _createMonthlyPriceAndSubscribeButtonArea(
    BuildContext context,
    ChosenMembershipTypeState state,
    TextStyle titleStyle,
    TextStyle enabledButtonLabelStyle,
    TextStyle disabledButtonLabelStyle,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppHeaderText(
              textLabel: _displayMonthlyPrice(state), textStyle: titleStyle),
          _displaySubscribeButton(
              context, state, disabledButtonLabelStyle, enabledButtonLabelStyle)
        ],
      );

  // DISPLAY ===========================================================================================================
  String _displayMonthlyPrice(ChosenMembershipTypeState state) =>
      _findMonthlyPrice(state) == 0
          ? 'Free'
          : _findMonthlyPrice(state).toString();

  // SUBSCRIBE BUTTON ==================================================================================================
  // DISPLAY ===========================================================================================================
  Widget _displaySubscribeButton(
    BuildContext context,
    ChosenMembershipTypeState state,
    TextStyle disabledButtonLabelStyle,
    TextStyle enabledButtonLabelStyle,
  ) =>
      _findMonthlyPrice(state) == 0
          ? const SizedBox()
          : _checkWhetherUserSubscibeChosenMembershipType(state, context)
              ? _displayDisabledSubscribeButton(
                  context, disabledButtonLabelStyle)
              : _displayEnabledSubscribeButton(
                  context, enabledButtonLabelStyle);

  ChoiceContainer _displayDisabledSubscribeButton(
          BuildContext context, TextStyle disabledButtonLabelStyle) =>
      ChoiceContainer(
        labelStyle: disabledButtonLabelStyle,
        buttonBorderColor: _appColors.secondary.withOpacity(0.30),
        buttonColor: _appColors.secondary.withOpacity(0.50),
        containerText: 'Subscribe   ',
        onTap: null,
      );

  ChoiceContainer _displayEnabledSubscribeButton(
          BuildContext context, TextStyle enabledButtonLabelStyle) =>
      ChoiceContainer(
        labelStyle: enabledButtonLabelStyle,
        buttonBorderColor: _appColors.secondary,
        buttonColor: _appColors.secondary,
        containerText: 'Subscribe   ',
        onTap: () {
          if (kDebugMode) {
            print('Subscribe button has been clicked!!!');
          }
        },
      );

  // GENERAL METHODS ===================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherUserSubscibeChosenMembershipType(
          ChosenMembershipTypeState state, BuildContext context) =>
      _findMembershiipTypeId(state) == _findUserMembershipTypeId(context);

  // Find Methods ------------------------------------------------------------------------------------------------------
  double _findMonthlyPrice(ChosenMembershipTypeState state) =>
      state.chosenMembershipTypeList.last.monthlyPrice;

  int? _findMembershiipTypeId(ChosenMembershipTypeState state) =>
      state.chosenMembershipTypeList.last.membershipTypeId;

  int? _findUserMembershipTypeId(BuildContext context) => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .membershipTypeId;

  // GENERAL METHODS ===================================================================================================
  bool _checkWhetherMembershipTypeIsBasic(ChosenMembershipTypeState state) =>
      state.chosenMembershipTypeList.last.membershipTypeName == 'Basic User';
}
