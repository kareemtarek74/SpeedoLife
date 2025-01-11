import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/home_page_view.dart';

import '../../../Main/presentation/views/widgets/custom_dots_indicator.dart';

class HomePageViewSection extends StatefulWidget {
  const HomePageViewSection({
    super.key,
  });

  @override
  State<HomePageViewSection> createState() => _HomePageViewSectionState();
}

PageController pageController = PageController();
int pageNum = 0;

class _HomePageViewSectionState extends State<HomePageViewSection> {
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        pageNum = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePageView(
          controller: pageController,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomDotsIndicator(
          pageNum: pageNum,
        ),
      ],
    );
  }
}
