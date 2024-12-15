import 'package:flutter/material.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/custom_cart_button.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Row(
                children: [
                  buildQuantityButton(Icons.add),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '1',
                    style: Styles.styleBold16(context)
                        .copyWith(color: const Color(0xff2A2A2A)),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  buildQuantityButton(Icons.remove),
                  const Spacer(),
                  Text(
                    '8,000 د',
                    style: Styles.styleBold16(context)
                        .copyWith(color: const Color(0xff2A2A2A)),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomCartButton(
                      iconSize: 20,
                      style: Styles.styleBold16(context)
                          .copyWith(color: Colors.white),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFFB143C)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget buildQuantityButton(IconData icon) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
