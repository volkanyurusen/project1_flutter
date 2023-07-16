import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class ProfileBodyAccountDetailsArea extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final TextStyle headlineMedium;
  final TextStyle titleHeadline;

  ProfileBodyAccountDetailsArea({
    required this.headlineMedium,
    required this.titleHeadline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final CountryCityDynamicByIdBloc countryCityDynamicByIdBloc =
        context.read<CountryCityDynamicByIdBloc>();
    final CountryDynamicBloc countryDynamicBloc =
        context.read<CountryDynamicBloc>();
    final CityDynamicByCountryBloc cityDynamicByCountryBloc =
        context.read<CityDynamicByCountryBloc>();

    return CustomColumn(children: [
      AppHeaderText(textLabel: 'Account Details', textStyle: titleHeadline),
      CustomAppDivider(),
      const CustomAppSizedBox(height: 20),
      GestureDetector(
          onTap: () => _goToScreenOfPersonalDetailsWhileBringingNecessaryBloc(
              context,
              userBloc,
              countryCityDynamicByIdBloc,
              countryDynamicBloc,
              cityDynamicByCountryBloc),
          child: AppHeaderText(
              textLabel: 'Personal Details', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 30),
      GestureDetector(
          onTap: () => _goToScreenOfActivityPreferences(context),
          child: AppHeaderText(
              textLabel: 'Activity Preferences', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 30),
      GestureDetector(
          onTap: () => _goToScreenOfUserTypeDetails(context),
          child: AppHeaderText(
              textLabel: 'User Type Details', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 30),
      GestureDetector(
          onTap: () => _goToScreenOfSecurityDetails(context),
          child: AppHeaderText(
              textLabel: 'Security Details', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 30),
      GestureDetector(
          onTap: () => _goToScreenOfPaymentDetails(context),
          child: AppHeaderText(
              textLabel: 'Payment Details', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 30),
      GestureDetector(
          onTap: () {
            if (kDebugMode) {
              print('Notifications button is clicked!!!');
            }
          },
          child: AppHeaderText(
              textLabel: 'Notification', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 40),
    ]);
  }

  void _goToScreenOfPersonalDetailsWhileBringingNecessaryBloc(
    BuildContext context,
    UserBloc userBloc,
    CountryCityDynamicByIdBloc countryCityDynamicByIdBloc,
    CountryDynamicBloc countryDynamicBloc,
    CityDynamicByCountryBloc cityDynamicByCountryBloc,
  ) {
    userBloc.add(LoadUserEvent(uId: _appNumberConstants.appUserId));
    countryCityDynamicByIdBloc.add(LoadCountryCityDynamicByIdEvent(
        countryCityDynamicByIdId: context
            .read<UserDynamicBloc>()
            .state
            .userDynamicList
            .last
            .countryCityDynamic
            .countryCityId!));
    countryDynamicBloc.add(LoadCountryDynamicEvent());
    cityDynamicByCountryBloc.add(LoadCityDynamicByCountryEvent(
        countryDetail: context
            .read<UserDynamicBloc>()
            .state
            .userDynamicList
            .last
            .countryCityDynamic
            .countryDynamic
            .countryDetail));
    Navigator.of(context).pushNamed(ScreenOfPersonalDetails.routeName);
  }

  _goToScreenOfUserTypeDetails(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfUserTypeDetails.routeName);
  }

  _goToScreenOfActivityPreferences(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfActivityPreferences.routeName);
  }

  _goToScreenOfPaymentDetails(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfPaymentDetails.routeName);
  }

  _goToScreenOfSecurityDetails(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfSecurityDetails.routeName);
  }
}
