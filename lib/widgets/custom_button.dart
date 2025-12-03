import 'package:coffee_app/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool full;
  const CustomButton({required this.text, required this.onPressed, this.full = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: full ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}
