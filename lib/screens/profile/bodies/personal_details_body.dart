import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsBody extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final UserBloc userBloc;
  final UserDynamicBloc userDynamicBloc;

  PersonalDetailsBody({
    required this.userDynamicBloc,
    required this.userBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightTextColor = _appColors.dividerColor.withOpacity(0.75);
    TextStyle? nameSurnameTextStyle =
        Theme.of(context).textTheme.displayMedium!;
    TextStyle? detailTextStyle = Theme.of(context)
        .textTheme
        .displaySmall!
        .copyWith(fontWeight: FontWeight.normal);
    TextStyle? titleTextStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.normal, color: lightTextColor);

    return CustomAppBody(
      children: [
        CustomColumn(children: [
          const CustomAppSizedBox(height: 20),
          BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => current.status != previous.status,
            bloc: userBloc,
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return _displaySkelton();
                case Status.loading:
                  return _displaySkelton();
                case Status.success:
                  return CustomColumn(
                    children: [
                      AppHeaderText(
                          textLabel: state.userList.last.nameSurname,
                          textStyle: nameSurnameTextStyle),
                      AppHeaderText(
                          textLabel:
                              'since ${state.userList.last.createdAt.year.toString()}',
                          textStyle: titleTextStyle),
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
          AppHeaderText(textLabel: 'Username', textStyle: titleTextStyle),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => current.status != previous.status,
            bloc: userBloc,
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return _displaySkelton();
                case Status.loading:
                  return _displaySkelton();
                case Status.success:
                  return AppHeaderText(
                      textLabel: state.userList.last.username,
                      textStyle: detailTextStyle);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        CustomColumn(children: [
          const CustomAppSizedBox(height: 30),
          AppHeaderText(textLabel: 'Birthyear', textStyle: titleTextStyle),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => current.status != previous.status,
            bloc: userBloc,
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return _displaySkelton();
                case Status.loading:
                  return _displaySkelton();
                case Status.success:
                  return AppHeader(
                      firstWidget: AppHeaderText(
                          textLabel: state.userList.last.birthyear.toString(),
                          textStyle: detailTextStyle),
                      thirdWidget: AppHeaderText(
                          textLabel: _appFunctions.determineAgeClassification(
                              state.userList.last.birthyear),
                          textStyle: detailTextStyle.copyWith(
                              color: _appColors.primary)));
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        CustomColumn(children: [
          const CustomAppSizedBox(height: 30),
          AppHeaderText(textLabel: 'Gender', textStyle: titleTextStyle),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => current.status != previous.status,
            bloc: userBloc,
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return _displaySkelton();
                case Status.loading:
                  return _displaySkelton();
                case Status.success:
                  return AppHeaderText(
                      textLabel: state.userList.last.gender.genderDetail
                          .toCapitalized(),
                      textStyle: detailTextStyle);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        CustomColumn(children: [
          const CustomAppSizedBox(height: 30),
          AppHeaderText(textLabel: 'Email', textStyle: titleTextStyle),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => current.status != previous.status,
            bloc: userBloc,
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return _displaySkelton();
                case Status.loading:
                  return _displaySkelton();
                case Status.success:
                  return AppHeaderText(
                      textLabel: state.userList.last.email,
                      textStyle: detailTextStyle);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        CustomColumn(children: [
          const CustomAppSizedBox(height: 30),
          AppHeaderText(textLabel: 'Address', textStyle: titleTextStyle),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => current.status != previous.status,
            bloc: userBloc,
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return _displaySkelton();
                case Status.loading:
                  return _displaySkelton();
                case Status.success:
                  return AppHeaderText(
                      textLabel: state.userList.last.address,
                      textStyle: detailTextStyle);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        CustomColumn(children: [
          const CustomAppSizedBox(height: 30),
          AppHeaderText(textLabel: 'City & Country', textStyle: titleTextStyle),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => current.status != previous.status,
            bloc: userBloc,
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return _displaySkelton();
                case Status.loading:
                  return _displaySkelton();
                case Status.success:
                  return AppHeaderText(
                      textLabel:
                          '${state.userList.last.countryCity.country.countryDetail} / ${state.userList.last.countryCity.city.cityDetail}',
                      textStyle: detailTextStyle);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        CustomColumn(children: [
          const CustomAppSizedBox(height: 30),
          AppHeaderText(textLabel: 'About yourself', textStyle: titleTextStyle),
          const CustomAppSizedBox(height: 10),
          BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => current.status != previous.status,
            bloc: userBloc,
            builder: (context, state) {
              switch (state.status) {
                case Status.initial:
                  return _displaySkelton();
                case Status.loading:
                  return _displaySkelton();
                case Status.success:
                  return AppHeaderText(
                      textLabel: state.userList.last.aboutUser,
                      textStyle: detailTextStyle);
                case Status.failure:
                  return StateError(error: state.error);
              }
            },
          )
        ]),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// SKELTON ==========================================================================================================
  Widget _displaySkelton() {
    return SkeltonContainer(height: 24, width: 200);
  }
}
