import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/widgets/widget.dart';

class DBProcessLoader extends StatelessWidget {
  final AppColors _appColors = AppColors();

  DBProcessLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackDropFilter(
      child: PopUpDialog(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppHeaderText(
                  textLabel: 'On progress...',
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: _appColors.scaffoldBackgroundColor)),
              const CustomAppSizedBox(),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
