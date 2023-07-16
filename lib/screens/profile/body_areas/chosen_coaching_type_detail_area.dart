import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCoachingTypeDetailArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final AppListConstants _appListConstants = AppListConstants();

  ChosenCoachingTypeDetailArea({Key? key}) : super(key: key);

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

    return _buildChosenCoachingTypeDetailColumn(
        bodyWidth,
        whiteColor,
        primaryColor,
        titleStyle,
        detailStyle,
        enabledButtonLabelStyle,
        disabledButtonLabelStyle);
  }

  // CHOSEN COACH TYPE DETAIL COLUMN ===================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<ChosenCoachingTypeCubit, ChosenCoachingTypeState>
      _buildChosenCoachingTypeDetailColumn(
    double bodyWidth,
    Color whiteColor,
    Color primaryColor,
    TextStyle titleStyle,
    TextStyle detailStyle,
    TextStyle enabledButtonLabelStyle,
    TextStyle disabledButtonLabelStyle,
  ) =>
          BlocBuilder<ChosenCoachingTypeCubit, ChosenCoachingTypeState>(
              builder: (context, state) {
            if (state.chosenCoachingTypeList.isEmpty) {
              return NothingReturned();
            } else {
              return _createChosenCoachingTypeDetailColumn(
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

  // CHOSEN COACH TYPE DETAIL COLUMN ===================================================================================
  // CREATE ============================================================================================================
  ChosenTypeColumn _createChosenCoachingTypeDetailColumn(
    BuildContext context,
    ChosenCoachingTypeState state,
    double bodyWidth,
    Color primaryColor,
    Color whiteColor,
    TextStyle titleStyle,
    TextStyle detailStyle,
    TextStyle enabledButtonLabelStyle,
    TextStyle disabledButtonLabelStyle,
  ) =>
      ChosenTypeColumn(
        color: _checkWhetherCoachingTypeIsBasic(state)
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
          ChosenCoachingTypeState state, TextStyle titleStyle) =>
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
          ChosenCoachingTypeState state, TextStyle titleStyle) =>
      AppHeaderText(
          textLabel: _findCoachingTypeName(state), textStyle: titleStyle);

  TypeCardTypeIcon _displayTypeCardIcon(ChosenCoachingTypeState state) =>
      TypeCardTypeIcon(child: _displayCorrectTypeCardIcon(state));

  Icon _displayCorrectTypeCardIcon(ChosenCoachingTypeState state) =>
      _appListConstants.typeIcon
          .elementAt(_checkWhetherCoachingTypeIsBasic(state) ? 0 : 1);

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findCoachingTypeName(ChosenCoachingTypeState state) =>
      state.chosenCoachingTypeList.last.coachingTypeName;

  // TITLE AND ICON AREA ===============================================================================================
  // CREATE ============================================================================================================
  CustomColumn _createDetailTitleIconAndContentArea(
    ChosenCoachingTypeState state,
    Color whiteColor,
    TextStyle detailStyle,
  ) =>
      CustomColumn(
          children: _generateDetailTitleIconAndContentArea(
              state, whiteColor, detailStyle));

  // GENERATE ==========================================================================================================
  List<Widget> _generateDetailTitleIconAndContentArea(
    ChosenCoachingTypeState state,
    Color whiteColor,
    TextStyle detailStyle,
  ) =>
      List.generate(
        _appListConstants.platinumCoachingTypeValue.length,
        (index) => AppHeader(
          spaceFromUpperWidget: index == 0 ? 0 : 5,
          firstWidget: _createDetailTitleAndIconArea(
              state, index, whiteColor, detailStyle),
          thirdWidget: _displayContent(state, index, detailStyle),
        ),
      );

  // ICONS AND DETAIL AREA =============================================================================================
  // CREATE ===========================================================================================================
  AppHeader _createDetailTitleAndIconArea(ChosenCoachingTypeState state,
          int index, Color whiteColor, TextStyle detailStyle) =>
      AppHeader(
        firstWidget: _displayCorrectIcon(state, index, whiteColor),
        secondWidget: const CustomAppSizedBox(width: 5),
        thirdWidget: _displayDetailTitle(state, index, detailStyle),
      );

  // ICONS =============================================================================================================
  // DISPLAY ===========================================================================================================
  Icon _displayCorrectIcon(
    ChosenCoachingTypeState state,
    int index,
    Color whiteColor,
  ) =>
      _toJsonChosenCoachingTypeDetail(state)
                  .entries
                  .elementAt(index + 2)
                  .value ==
              true
          ? _displayIncludedIcon(whiteColor)
          : _toJsonChosenCoachingTypeDetail(state)
                      .entries
                      .elementAt(index + 2)
                      .value ==
                  false
              ? _displayExcludedIcon(whiteColor)
              : _toJsonChosenCoachingTypeDetail(state)
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
  Map<String, dynamic> _toJsonChosenCoachingTypeDetail(
          ChosenCoachingTypeState state) =>
      state.chosenCoachingTypeList.last.toJson();

  // DETAIL TITLE ======================================================================================================
  // DISPLAY ===========================================================================================================
  AppHeaderText _displayDetailTitle(
    ChosenCoachingTypeState state,
    int index,
    TextStyle detailStyle,
  ) =>
      AppHeaderText(
          textLabel: _findDetailTitleText(state, index).toCapitalized(),
          textStyle: detailStyle);

  // METHODS ===========================================================================================================
  // Bring Methods -----------------------------------------------------------------------------------------------------
  String _bringKeyOfCoachingTypeOfCoach(
          ChosenCoachingTypeState state, int index) =>
      _toJsonChosenCoachingTypeDetail(state).entries.elementAt(index + 2).key;

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findDetailTitleText(ChosenCoachingTypeState state, int index) =>
      _appFunctions
          .setWithoutUnderscore(_bringKeyOfCoachingTypeOfCoach(state, index));

  /// DETAIL TITLE CONTENT AREA ========================================================================================
  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayContent(
          ChosenCoachingTypeState state, int index, TextStyle detailStyle) =>
      AppHeaderText(
          textLabel: _findContentText(state, index), textStyle: detailStyle);

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findContentText(ChosenCoachingTypeState state, int index) =>
      _toJsonChosenCoachingTypeDetail(state)
                  .entries
                  .elementAt(index + 2)
                  .value ==
              true
          ? 'Included'
          : _toJsonChosenCoachingTypeDetail(state)
                      .entries
                      .elementAt(index + 2)
                      .value ==
                  false
              ? 'Excluded'
              : _toJsonChosenCoachingTypeDetail(state)
                          .entries
                          .elementAt(index + 2)
                          .value ==
                      0
                  ? 'None'
                  : state.chosenCoachingTypeList.last.coachingTypeName ==
                          'Basic Coach'
                      ? _toJsonChosenCoachingTypeDetail(state)
                              .entries
                              .elementAt(index + 2)
                              .value
                              .toString() +
                          _appListConstants.basicCoachingTypeValue
                              .elementAt(index)
                      : _toJsonChosenCoachingTypeDetail(state)
                              .entries
                              .elementAt(index + 2)
                              .value
                              .toString() +
                          _appListConstants.platinumCoachingTypeValue
                              .elementAt(index);

  // MONTHLY PRICE AND SUBSCRIBE BUTTON AREA ===========================================================================
  // CREATE ============================================================================================================
  Row _createMonthlyPriceAndSubscribeButtonArea(
    BuildContext context,
    ChosenCoachingTypeState state,
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
  String _displayMonthlyPrice(ChosenCoachingTypeState state) =>
      _findMonthlyPrice(state) == 0
          ? 'Free'
          : _findMonthlyPrice(state).toString();

  // SUBSCRIBE BUTTON ==================================================================================================
  // DISPLAY ===========================================================================================================
  Widget _displaySubscribeButton(
    BuildContext context,
    ChosenCoachingTypeState state,
    TextStyle disabledButtonLabelStyle,
    TextStyle enabledButtonLabelStyle,
  ) =>
      _findMonthlyPrice(state) == 0
          ? const SizedBox()
          : _checkWhetherCoachSubscibeChosenCoachingType(state, context)
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
  bool _checkWhetherCoachSubscibeChosenCoachingType(
          ChosenCoachingTypeState state, BuildContext context) =>
      _findMembershiipTypeId(state) == _findCoachCoachingTypeId(context);

  // Find Methods ------------------------------------------------------------------------------------------------------
  double _findMonthlyPrice(ChosenCoachingTypeState state) =>
      state.chosenCoachingTypeList.last.monthlyPrice;

  int? _findMembershiipTypeId(ChosenCoachingTypeState state) =>
      state.chosenCoachingTypeList.last.coachingTypeId;

  int? _findCoachCoachingTypeId(BuildContext context) => context
      .read<CoachDynamicBloc>()
      .state
      .coachDynamicList
      .last
      .coachingTypeDynamic
      .coachingTypeId;

  // GENERAL METHODS ===================================================================================================
  bool _checkWhetherCoachingTypeIsBasic(ChosenCoachingTypeState state) =>
      state.chosenCoachingTypeList.last.coachingTypeName == 'Basic Coach';
}









// class ChosenCoachingTypeBody extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppListConstants _appListConstants = AppListConstants();

//   ChosenCoachingTypeBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double bodyWidth = MediaQuery.of(context).size.width;
//     Color whiteColor = _appColors.scaffoldBackgroundColor;
//     Color primaryColor = _appColors.primary;
//     TextStyle? headline2 =
//         Theme.of(context).textTheme.displayLarge!.copyWith(color: whiteColor);
//     TextStyle? titleLarge =
//         Theme.of(context).textTheme.titleLarge!.copyWith(color: whiteColor);

//     return Column(children: [
//       BlocBuilder<ChosenCoachingTypeCubit, ChosenCoachingTypeState>(
//           builder: (context, state) {
//         if (state.chosenCoachingTypeList.isEmpty) {
//           return NothingReturned();
//         } else {
//           return Expanded(
//               child: Container(
//             decoration: BoxDecoration(
//                 color: state.chosenCoachingTypeList.last.coachingTypeName ==
//                         'Basic Coach'
//                     ? _appColors.textColor
//                     : primaryColor,
//                 borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(50),
//                     topLeft: Radius.circular(50))),
//             width: bodyWidth,
//             child: AppBody(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                     Container(
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(width: 2.0, color: whiteColor),
//                         ),
//                         child: _appListConstants.typeIcon[state
//                                     .chosenCoachingTypeList
//                                     .last
//                                     .coachingTypeName ==
//                                 ' Basic Coach'
//                             ? 0
//                             : 1]),
//                     const CustomAppSizedBox(width: 10),
//                     AppHeaderText(
//                         textLabel:
//                             state.chosenCoachingTypeList.last.coachingTypeName,
//                         textStyle: headline2),
//                   ]),
//                   CustomColumn(
//                     children: List.generate(
//                       _appListConstants.platinumCoachingTypeValue.length,
//                       (index) => AppHeader(
//                         spaceFromUpperWidget: index == 0 ? 0 : 10,
//                         firstWidget: AppHeader(
//                           firstWidget: state.chosenCoachingTypeList.last
//                                       .toJson()
//                                       .entries
//                                       .elementAt(index + 2)
//                                       .value ==
//                                   true
//                               ? Icon(Icons.done_sharp,
//                                   color: whiteColor, size: 18)
//                               : state.chosenCoachingTypeList.last
//                                           .toJson()
//                                           .entries
//                                           .elementAt(index + 2)
//                                           .value ==
//                                       false
//                                   ? Icon(Icons.clear_sharp,
//                                       color: whiteColor, size: 18)
//                                   : state.chosenCoachingTypeList.last
//                                               .toJson()
//                                               .entries
//                                               .elementAt(index + 2)
//                                               .value ==
//                                           0
//                                       ? Icon(Icons.clear_sharp,
//                                           color: whiteColor, size: 18)
//                                       : Icon(Icons.done_sharp,
//                                           color: whiteColor, size: 18),
//                           secondWidget: const CustomAppSizedBox(width: 5),
//                           thirdWidget: AppHeaderText(
//                               textLabel: _appFunctions
//                                   .setWithoutUnderscore(state
//                                       .chosenCoachingTypeList.last
//                                       .toJson()
//                                       .entries
//                                       .elementAt(index + 2)
//                                       .key)
//                                   .toCapitalized(),
//                               textStyle: titleLarge),
//                         ),
//                         thirdWidget: AppHeaderText(
//                             textLabel: state.chosenCoachingTypeList.last
//                                         .toJson()
//                                         .entries
//                                         .elementAt(index + 2)
//                                         .value ==
//                                     true
//                                 ? 'Included'
//                                 : state.chosenCoachingTypeList.last
//                                             .toJson()
//                                             .entries
//                                             .elementAt(index + 2)
//                                             .value ==
//                                         false
//                                     ? 'Excluded'
//                                     : state.chosenCoachingTypeList.last
//                                                 .toJson()
//                                                 .entries
//                                                 .elementAt(index + 2)
//                                                 .value ==
//                                             0
//                                         ? 'None'
//                                         : state.chosenCoachingTypeList.last
//                                                     .coachingTypeName ==
//                                                 'Basic Coach'
//                                             ? state.chosenCoachingTypeList.last
//                                                     .toJson()
//                                                     .entries
//                                                     .elementAt(index + 2)
//                                                     .value
//                                                     .toString() +
//                                                 _appListConstants.basicCoachingTypeValue
//                                                     .elementAt(index)
//                                             : state.chosenCoachingTypeList.last
//                                                     .toJson()
//                                                     .entries
//                                                     .elementAt(index + 2)
//                                                     .value
//                                                     .toString() +
//                                                 _appListConstants
//                                                     .platinumCoachingTypeValue
//                                                     .elementAt(index),
//                             textStyle: titleLarge),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       BlocBuilder<ChosenCoachingTypeCubit,
//                           ChosenCoachingTypeState>(
//                         builder: (context, state) {
//                           if (state.chosenCoachingTypeList.isEmpty) {
//                             return const SizedBox();
//                           } else {
//                             return AppHeaderText(
//                                 textLabel: state.chosenCoachingTypeList.last
//                                             .monthlyPrice ==
//                                         0
//                                     ? 'Free'
//                                     : state.chosenCoachingTypeList.last
//                                         .monthlyPrice
//                                         .toString(),
//                                 textStyle: headline2);
//                           }
//                         },
//                       ),
//                       state.chosenCoachingTypeList.last.monthlyPrice == 0
//                           ? const SizedBox()
//                           : AppNumberConstants().appCoachId != 0
//                               ? state.chosenCoachingTypeList.last.coachingTypeId ==
//                                       context
//                                           .read<CoachDynamicBloc>()
//                                           .state
//                                           .coachDynamicList
//                                           .last
//                                           .coachingTypeDynamic
//                                           .coachingTypeId
//                                   ? ChoiceContainer(
//                                       labelStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                                           color: _appColors.scaffoldBackgroundColor
//                                               .withBlue(2)
//                                               .withGreen(2)
//                                               .withRed(2)
//                                               .withOpacity(0.5)),
//                                       buttonBorderColor: _appColors.secondary
//                                           .withOpacity(0.50),
//                                       buttonColor: _appColors.secondary
//                                           .withOpacity(0.50),
//                                       containerText: 'Subscribe   ',
//                                       onTap: null)
//                                   : ChoiceContainer(
//                                       labelStyle: Theme.of(context)
//                                           .textTheme
//                                           .headlineMedium!
//                                           .copyWith(
//                                               color: _appColors
//                                                   .scaffoldBackgroundColor),
//                                       buttonBorderColor: _appColors.secondary,
//                                       buttonColor: _appColors.secondary,
//                                       containerText: 'Subscribe   ',
//                                       onTap: () {
//                                         if (kDebugMode) {
//                                           print(
//                                               'Subscribe button has been clicked!!!');
//                                         }
//                                       })
//                               : ChoiceContainer(
//                                   labelStyle: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium!
//                                       .copyWith(color: _appColors.scaffoldBackgroundColor),
//                                   buttonBorderColor: _appColors.secondary,
//                                   buttonColor: _appColors.secondary,
//                                   containerText: 'Subscribe   ',
//                                   onTap: () {
//                                     if (kDebugMode) {
//                                       print(
//                                           'Subscribe button has been clicked!!!');
//                                     }
//                                   })
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ));
//         }
//       }),
//     ]);
//   }
// }
