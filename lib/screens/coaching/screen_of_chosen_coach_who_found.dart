import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfChosenCoachWhoFound extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_coach_who_found';

  const ScreenOfChosenCoachWhoFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createCoachPhotoOnTop(context),
      body: const ChosenCoachWhoFoundBody(),
    );
  }

  /// CREATE ===========================================================================================================
  _createCoachPhotoOnTop(BuildContext context) => PreferredSizeForPicture(
      context: context, child: AppBar(flexibleSpace: _buildChosenCoachPhoto()));

  /// BUILD ============================================================================================================
  BlocBuilder<ChosenCoachAmongThoseWhoFoundCubit,
          ChosenCoachAmongThoseWhoFoundState>
      _buildChosenCoachPhoto() => BlocBuilder<
              ChosenCoachAmongThoseWhoFoundCubit,
              ChosenCoachAmongThoseWhoFoundState>(
          builder: (context, chosenState) => AppBarHero(
                tag: _choiceCoachHeroTag(chosenState),
                image: _displayChosenCoachPhoto(chosenState),
              ));

  /// DISPLAY ==========================================================================================================
  NetworkImage _displayChosenCoachPhoto(
    ChosenCoachAmongThoseWhoFoundState chosenState,
  ) =>
      NetworkImage(chosenState
          .chosenTrainingOfferResponseDynamicWithDistanceList
          .last
          .trainingOfferDynamic
          .coachDynamic
          .userDynamic
          .picUrl);

  /// METHODS ==========================================================================================================
  /// Hero Methods -----------------------------------------------------------------------------------------------------
  String _choiceCoachHeroTag(
    ChosenCoachAmongThoseWhoFoundState chosenState,
  ) =>
      chosenState.chosenTrainingOfferResponseDynamicWithDistanceList.last
          .trainingOfferResponseId
          .toString() +
      chosenState.chosenTrainingOfferResponseDynamicWithDistanceList.last
          .trainingOfferDynamic.coachDynamic.userDynamic.uId!
          .toString();
}
