import 'package:flutter/material.dart';

class AppBarHero extends StatelessWidget {
  final Object tag;
  final ImageProvider<Object> image;

  const AppBarHero({
    required this.tag,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.25,
            image: image,
          ),
        ),
      ),
    );
  }
}
