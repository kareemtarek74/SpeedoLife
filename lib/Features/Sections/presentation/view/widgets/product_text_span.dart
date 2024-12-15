import 'package:flutter/material.dart';

class ProductTextSpan extends StatelessWidget {
  const ProductTextSpan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text:
                'لوشن الترطيب للبشرة هو منتج مبتكر وفعّال يُصمّم لترطيب وتغذية البشرة ',
            style: TextStyle(
              color: Color(0xFF3F3F3F),
              fontSize: 14,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: 'عرض المزيد',
            style: TextStyle(
              color: Color(0xFFEC0E3A),
              fontSize: 14,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.right,
    );
  }
}
