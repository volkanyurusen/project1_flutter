import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingDetailsBody extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final CoachBloc coachBloc;
  final CoachDynamicBloc coachDynamicBloc;

  CoachingDetailsBody({
    required this.coachBloc,
    required this.coachDynamicBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightTextColor = _appColors.dividerColor.withOpacity(0.75);
    TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium!;
    TextStyle? displaySmall = Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(fontWeight: FontWeight.normal);
    TextStyle? bodyLarge = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.normal, color: lightTextColor);

    return CustomAppBody(
      children: [
        CustomColumn(children: [
          const CustomAppSizedBox(height: 20),
          BlocBuilder<CoachDynamicBloc, CoachDynamicState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return SkeltonContainer(height: 24, width: 200);
                case Status.loading:
                  return SkeltonContainer(height: 24, width: 200);
                case Status.success:
                  return CustomColumn(
                    children: [
                      AppHeaderText(
                          textLabel:
                              'became a coach in ${state.coachDynamicList.last.createdAt.year.toString()}',
                          textStyle: displayMedium),
                    ],
                  );
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        CustomColumn(children: [
          const CustomAppSizedBox(height: 30),
          AppHeaderText(textLabel: 'Experience', textStyle: bodyLarge),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<CoachDynamicBloc, CoachDynamicState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return SkeltonContainer(height: 24, width: 200);
                case Status.loading:
                  return SkeltonContainer(height: 24, width: 200);
                case Status.success:
                  return AppHeader(
                    firstWidget: AppHeaderText(
                        textLabel: state.coachDynamicList.last
                            .coachingExperienceDynamic.experienceYear,
                        textStyle: displaySmall),
                    thirdWidget: AppHeaderText(
                        textLabel: state.coachDynamicList.last
                                    .coachingExperienceDynamic.experienceYear ==
                                'Less than 5 years'
                            ? ''
                            : 'Experienced',
                        textStyle:
                            displaySmall.copyWith(color: _appColors.primary)),
                  );
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        CustomColumn(children: [
          const CustomAppSizedBox(height: 30),
          AppHeaderText(textLabel: 'Minimum lesson', textStyle: bodyLarge),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<CoachDynamicBloc, CoachDynamicState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return SkeltonContainer(height: 24, width: 200);
                case Status.loading:
                  return SkeltonContainer(height: 24, width: 200);
                case Status.success:
                  return AppHeaderText(
                      textLabel:
                          state.coachDynamicList.last.minLesson.toString() +
                              (state.coachDynamicList.last.minLesson > 1
                                  ? ' lessons'
                                  : ' lesson'),
                      textStyle: displaySmall);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        CustomColumn(children: [
          const CustomAppSizedBox(height: 30),
          AppHeaderText(textLabel: 'Price (per lesson)', textStyle: bodyLarge),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<CoachDynamicBloc, CoachDynamicState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return SkeltonContainer(height: 24, width: 200);
                case Status.loading:
                  return SkeltonContainer(height: 24, width: 200);
                case Status.success:
                  return AppHeaderText(
                      textLabel: _appFunctions.correctNumberFormat
                          .format(state.coachDynamicList.last.perLessonPrice)
                          .toString(),
                      textStyle: displaySmall);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        CustomColumn(children: [
          const CustomAppSizedBox(height: 30),
          AppHeaderText(textLabel: 'Price (Total)', textStyle: bodyLarge),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<CoachDynamicBloc, CoachDynamicState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return SkeltonContainer(height: 24, width: 200);
                case Status.loading:
                  return SkeltonContainer(height: 24, width: 200);
                case Status.success:
                  int totalPrice = state.coachDynamicList.last.perLessonPrice *
                      state.coachDynamicList.last.minLesson;
                  return AppHeaderText(
                      textLabel:
                          _appFunctions.correctNumberFormat.format(totalPrice),
                      textStyle: displaySmall);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),

        // CustomColumn(children: [
        //   const CustomAppSizedBox(height: 30),
        //   AppHeaderText(textLabel: 'City & Country', textStyle: bodyLarge ),
        //   const CustomAppSizedBox(height: 10),
        //   BlocBuilder<CoachDynamicBloc, CoachDynamicState>(
        //     builder: (context, state) {
        //       switch (state.status) {
        //         case Status.initial:
        //           return SkeltonContainer(height: 24, width: 200);
        //         case Status.loading:
        //           return SkeltonContainer(height: 24, width: 200);
        //         case Status.success:
        //           return AppHeaderText(
        //               textLabel:
        //                   '${state.coachDynamicList.last.countryCity.city.cityDetail} / ${state.coachDynamicList.last.countryCity.country.countryDetail}',
        //               textStyle: displaySmall );
        //         case Status.failure:
        //           return StateError(error: state.error);
        //       }
        //     },
        //   )
        // ]),
        // CustomColumn(children: [
        //   const CustomAppSizedBox(height: 30),
        //   AppHeaderText(textLabel: 'About yourself', textStyle: bodyLarge ),
        //   const CustomAppSizedBox(height: 10),
        //   BlocBuilder<CoachDynamicBloc, CoachDynamicState>(
        //     builder: (context, state) {
        //       switch (state.status) {
        //         case Status.initial:
        //           return SkeltonContainer(height: 24, width: 200);
        //         case Status.loading:
        //           return SkeltonContainer(height: 24, width: 200);
        //         case Status.success:
        //           return AppHeaderText(
        //               textLabel:
        //                   '${state.coachDynamicList.last.aboutUser}Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        //               textStyle: displaySmall );
        //         case Status.failure:
        //           return StateError(error: state.error);
        //       }
        //     },
        //   )
        // ]),
        // const CustomAppSizedBox(),
        // ElevatedButton(
        //     onPressed: () {
        //       print(
        //           'TextOfExperience: ${context.read<TextOfExperienceYearOnCoachingDetailEditingPopUpBloc>().state.experienceYear}');
        //       print(
        //           'DropdownOfExperience: ${context.read<DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc>().state.fieldText}');
        //       print(
        //           'CoachExperience: ${context.read<CoachBloc>().state.coachList.last.coachingExperience.experienceYear}');
        //       print(
        //           'TextOfMinLesson: ${context.read<TextOfMinLessonOnCoachingDetailEditingPopUpBloc>().state.minLesson}');
        //       print(
        //           'TextFieldOfMinLesson: ${context.read<TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc>().state.fieldText}');
        //       print(
        //           'CoachMinLesson: ${context.read<CoachBloc>().state.coachList.last.minLesson}');
        //       print(
        //           'TextOfPerLessonPrice: ${context.read<TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>().state.perLessonPrice}');
        //       print(
        //           'TextFieldOfPerLessonPrice: ${context.read<TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc>().state.fieldText}');
        //       print(
        //           'CoachPerLessonPrice: ${context.read<CoachBloc>().state.coachList.last.perLessonPrice}');
        //     },
        //     child: Text('control'))
      ],
    );
  }
}
