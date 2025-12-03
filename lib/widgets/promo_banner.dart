import 'package:coffee_app/theme/app_color.dart';
import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: Offset(0,4))
        ],
        image: DecorationImage(image: AssetImage('assets/images/promo_coffee.png'),fit: BoxFit.cover)
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Promo', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 8),
                Text('Buy one get\none FREE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                Spacer(),
                Text('Valid until 31 Dec', style: TextStyle(color: AppColors.greyText, fontSize: 12)),
              ],
            ),
          ),
          // SizedBox(width: 12),
          // Container(
          //   width: 120,
          //   height: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     image: DecorationImage(image: AssetImage('assets/images/promo_coffee.png'), fit: BoxFit.cover),
          //   ),
          // )
        ],
      ),
    );
  }
}
