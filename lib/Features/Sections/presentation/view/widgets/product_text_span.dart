import 'package:flutter/material.dart';

class ProductTextSpan extends StatelessWidget {
  const ProductTextSpan({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(
              color: Color(0xFF3F3F3F),
              fontSize: 14,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.right,
    );
  }
}
