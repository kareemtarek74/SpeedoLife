import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/custom_navigation_bar.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/main_view_body_bloc_consumer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (index) {
            currentViewIndex = index;

            setState(() {});
          },
        ),
        body: SafeArea(
          child: MainViewBodyBlocConsumer(currentViewIndex: currentViewIndex),
        ));
  }
}
