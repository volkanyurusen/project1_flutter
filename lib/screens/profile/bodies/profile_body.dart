import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/profile/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ProfileBody extends StatelessWidget {
  final AppColors _appColors = AppColors();

  ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? headlineMedium = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(
            fontWeight: FontWeight.normal,
            color: _appColors.textColor.withOpacity(0.85));
    TextStyle? titleHeadline = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: _appColors.textColor.withOpacity(1.00));

    return BlocBuilder<UserDynamicBloc, UserDynamicState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return const StateLoading();
          case Status.loading:
            return const StateLoading();
          case Status.success:
            return _createProfileBody(context, headlineMedium, titleHeadline);
          case Status.failure:
            return StateError(error: state.error);
        }
      },
    );
  }

  /// CREATE ===========================================================================================================
  CustomColumn _createProfileBody(
    BuildContext context,
    TextStyle headlineMedium,
    TextStyle titleHeadline,
  ) =>
      CustomColumn(
        children: [
          const ProfileBodyProfilePhotoArea(),
          _createProfileDetailBody(context, headlineMedium, titleHeadline),
        ],
      );

  Expanded _createProfileDetailBody(
    BuildContext context,
    TextStyle headlineMedium,
    TextStyle titleHeadline,
  ) =>
      Expanded(
        child: CustomAppBody(
          children: [
            ProfileBodyAccountDetailsArea(
                headlineMedium: headlineMedium, titleHeadline: titleHeadline),
            ProfileBodyLocationArea(
                headlineMedium: headlineMedium, titleHeadline: titleHeadline),
            ProfileBodyTypeDetailsArea(
                headlineMedium: headlineMedium, titleHeadline: titleHeadline),
            ProfileBodyCoachingDetailsArea(
                headlineMedium: headlineMedium, titleHeadline: titleHeadline),
            ProfileBodySupportArea(
                headlineMedium: headlineMedium, titleHeadline: titleHeadline),
            ProfileBodyLegalDetailsArea(
                headlineMedium: headlineMedium, titleHeadline: titleHeadline),
          ],
        ),
      );
}
