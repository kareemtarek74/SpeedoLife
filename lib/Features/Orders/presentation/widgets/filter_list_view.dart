import 'package:flutter/material.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class FilterListView extends StatefulWidget {
  const FilterListView(
      {super.key, required this.filters, required this.horizontalPadding});
  final List<String> filters;
  final double horizontalPadding;

  @override
  FilterListViewState createState() => FilterListViewState();
}

class FilterListViewState extends State<FilterListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filters.length,
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
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              padding: EdgeInsets.symmetric(
                  horizontal: widget.horizontalPadding, vertical: 9.0),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF1E2546) : Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color:
                      isActive ? Colors.transparent : const Color(0xFFDBDBDB),
                ),
              ),
              child: Text(widget.filters[index],
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
