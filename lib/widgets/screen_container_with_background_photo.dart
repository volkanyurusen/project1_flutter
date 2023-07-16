import 'package:flutter/widgets.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenContainerWithBackgroundPhoto extends StatelessWidget {
  final Widget child;
  final ImageProvider<Object> backgroundImage;

  const ScreenContainerWithBackgroundPhoto(
      {required this.child, super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: backgroundImage,
                  // AssetImage(
                  //     'assets/images/user_types/0${Random().nextInt(2)}.jpg'),
                  opacity: 0.5,
                  fit: BoxFit.cover),
            ),
            child: AppBody(child: child),
          ),
        ),
      ],
    );
  }
}
