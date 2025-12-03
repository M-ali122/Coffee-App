import 'package:coffee_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  const CategoryChip({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.symmetric(horizontal: 14.w,),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.softGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.dark,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
