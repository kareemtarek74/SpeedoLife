import 'package:flutter/material.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class FilterListView extends StatefulWidget {
  const FilterListView({super.key});

  @override
  FilterListViewState createState() => FilterListViewState();
}

class FilterListViewState extends State<FilterListView> {
  int selectedIndex = 0;

  final List<String> filters = ["الكل", "انتظار", "مكتمل", "مرفوض"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          bool isActive = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 23, vertical: 9.0),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF1E2546) : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color:
                      isActive ? Colors.transparent : const Color(0xFFDBDBDB),
                ),
              ),
              child: Text(filters[index],
                  style: Styles.styleBold12(context).copyWith(
                    color: isActive ? Colors.white : const Color(0xFF808080),
                  )),
            ),
          );
        },
      ),
    );
  }
}
