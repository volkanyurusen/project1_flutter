import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/screens/onboarding/onboarding_screens/onboarding_screens.dart';
import '../onboarding_widgets/onboarding_widgets.dart';
import '/../widgets/widget.dart';

class LaunchingScreen extends StatelessWidget {
  static const String routeName = 'onboarding_screen';
  final appColors = AppColors();

  LaunchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// This widget gets the device's screen size
          CustomScreenStack(
            assetImage:
                'assets/images/onboarding_screens/onboarding-screen-02.jpeg',
            imageFilterBlurSigmaX: 1.8,
            imageFilterBlurSigmaY: 1.8,
            color: Theme.of(context).primaryColor.withOpacity(0.75),
          ),

          /// This widget determines the edge of areas
          AppBody(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                /// CustomFlexible widgets determined the distance between
                /// the visual widgets
                const CustomFlexible(flex: 7, aspectRatio: 0.38),

                /// This widget keeps the logo which we will be added and
                /// the company name.
                Text(
                  'LOGO',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: appColors.tertiary),
                ),

                /// CustomFlexible widgets determined the distance between
                /// the visual widgets
                const CustomFlexible(flex: 3, aspectRatio: 0.07),

                ///This widget keeps the middle text about Policies
                _policyContainer(context),

                /// CustomFlexible widgets determined the distance between
                /// the visual widgets
                const CustomFlexible(flex: 2, aspectRatio: 0.03),

                /// LogIn Button which is covered by below Padding
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: appColors.tertiary),
                      minimumSize: Size(MediaQuery.of(context).size.width, 40),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Text(
                      'LOG IN',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: appColors.tertiary),
                    ),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    ),
                  ),
                ),

                /// SignIn button is covered by below Padding
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                    top: 25,
                    bottom: 25,
                  ),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: appColors.tertiary),
                      minimumSize: Size(MediaQuery.of(context).size.width, 40),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Text(
                      'SIGN IN',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: appColors.tertiary),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed('login_screen'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// This widget contains the Policy infromation on the Launching Page
  Container _policyContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 25, bottom: 25),
      child: RichTextWithMultipleRows(
        firstText:
            'By tapping Create Account or Sign in, you agree to our Term. Learn how we process your data in our ',
        // colorOfFirstText: appColors.tertiary,
        secondText: 'Privacy Policy and Cookies Policy.',
        colorOfSecondText: appColors.tertiary,
        textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: appColors.tertiary,
            ),
        textDecoration: TextDecoration.underline,
        textDecorationStyle: TextDecorationStyle.solid,
        sizeOfdecorationThickness: 1.5,
      ),
    );
  }
}
