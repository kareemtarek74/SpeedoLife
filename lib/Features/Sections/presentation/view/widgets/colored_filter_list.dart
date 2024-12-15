import 'package:flutter/material.dart';

class ColoredFilterList extends StatefulWidget {
  const ColoredFilterList({super.key});

  @override
  State<ColoredFilterList> createState() => _ColoredFilterListState();
}

class _ColoredFilterListState extends State<ColoredFilterList> {
  final List<Map<String, dynamic>> filterItems = [
    {"color": Colors.amber, "isActive": false},
    {"color": Colors.red, "isActive": false},
    {"color": Colors.teal, "isActive": true},
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filterItems.length,
        itemBuilder: (context, index) {
          final item = filterItems[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1,
                        color: activeIndex == index
                            ? Colors.black
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Container(
                  width: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: item['color'],
                      borderRadius: BorderRadius.circular(30)),
                )),
          );
        },
      ),
    );
  }
}
