import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTrainingOfferDetailBodyLessonPriceArea extends StatelessWidget {
  const ChosenTrainingOfferDetailBodyLessonPriceArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GroupedTrainingOfferConversationDynamicByUserState groupedState = context
        .read<GroupedTrainingOfferConversationDynamicByUserCubit>()
        .state;
    TextStyle? headline6 = Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(color: AppColors().secondary.withOpacity(0.75));

    return Column(
      children: [
        _createLessonPriceArea(groupedState, headline6),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  AppHeader _createLessonPriceArea(
    GroupedTrainingOfferConversationDynamicByUserState groupedState,
    TextStyle? headline6,
  ) =>
      AppHeader(
          firstWidget: _displayLessonPriceTitle(headline6),
          thirdWidget: _displayLessonPriceDetail(groupedState, headline6));

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayLessonPriceTitle(
    TextStyle? headline6,
  ) =>
      AppHeaderText(
        textLabel: 'Lesson Price',
        textStyle: headline6,
      );

  AppHeaderText _displayLessonPriceDetail(
    GroupedTrainingOfferConversationDynamicByUserState groupedState,
    TextStyle? headline6,
  ) =>
      AppHeaderText(
        textLabel: _findLessonPrice(groupedState),
        textStyle: headline6,
      );

  /// METHOD ===========================================================================================================
  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findLessonPrice(
    GroupedTrainingOfferConversationDynamicByUserState groupedState,
  ) =>
      '${groupedState.groupedTrainingOfferConversationDynamicList.last.trainingOfferResponseDynamic.trainingOfferDynamic.coachDynamic.perLessonPrice.toString()} / per lesson';
}
