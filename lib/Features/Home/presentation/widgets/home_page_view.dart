import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Main/presentation/views/widgets/my_card.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: List.generate(4, (index) => const MyCard()));
  }
}
