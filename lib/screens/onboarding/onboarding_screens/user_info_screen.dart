import 'package:flutter/material.dart';
import 'package:my_project/constants/app_colors.dart';
import '../onboarding_widgets/onboarding_widgets.dart';
import 'package:my_project/widgets/widget.dart';

class UserInfoScreen extends StatelessWidget {
  final TabController tabController;

  UserInfoScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(''),
      ),
      body: AppBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSizedBox(ratio: 0.015),
            Text(
              'What is your name',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
            const CustomSizedBox(ratio: 0.075),
            Text('First Name',
                style: Theme.of(context).textTheme.headlineSmall),
            TextField(
              keyboardType: TextInputType.name,
              maxLines: 1,
              cursorColor: appColors.textColor,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: appColors.textColor),
                ),
              ),
            ),
            const CustomSizedBox(ratio: 0.075),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        appColors: appColors,
        tabController: tabController,
      ),
    );
  }
}
