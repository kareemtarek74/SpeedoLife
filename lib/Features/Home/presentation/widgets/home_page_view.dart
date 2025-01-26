import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  final PageController controller;
  final List sliders;

  const HomePageView({
    super.key,
    required this.controller,
    required this.sliders,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343 / 156,
      child: PageView.builder(
        controller: controller,
        itemCount: sliders.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(sliders[index]['image']),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
