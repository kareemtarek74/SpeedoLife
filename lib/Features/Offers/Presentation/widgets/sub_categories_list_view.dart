import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Offers/Data/model/sub_categories_model.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class SubCategoriesListView extends StatefulWidget {
  const SubCategoriesListView({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    this.selectedCategoryId,
  });

  final List<SubCategoriesModel> categories;
  final Function(String categoryId) onCategorySelected;
  final String? selectedCategoryId;

  @override
  SubCategoriesListViewState createState() => SubCategoriesListViewState();
}

class SubCategoriesListViewState extends State<SubCategoriesListView> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.categories.indexWhere(
      (category) => category.id == widget.selectedCategoryId,
    );
    if (selectedIndex == -1) selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          itemBuilder: (context, index) {
            bool isActive = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                widget.onCategorySelected(widget.categories[index].id);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 9.0),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF1E2546) : Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color:
                        isActive ? Colors.transparent : const Color(0xFFDBDBDB),
                  ),
                ),
                child: Text(
                  widget.categories[index].name,
                  style: Styles.styleBold12(context).copyWith(
                    color: isActive ? Colors.white : const Color(0xFF808080),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
