import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedo_life/core/utils/app_colors.dart';

void copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.lightPrimaryColor),
          const SizedBox(width: 8),
          Text("تم نسخ الرقم: $text"),
        ],
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.black87,
    ),
  );
}
