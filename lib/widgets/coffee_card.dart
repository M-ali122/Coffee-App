import 'package:coffee_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import '../models/coffee_model.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeModel coffee;
  const CoffeeCard({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Hero(
                tag: coffee.id,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(image: AssetImage(coffee.image), fit: BoxFit.cover)),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(coffee.title, style: TextStyle(fontWeight: FontWeight.w700)),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        SizedBox(width: 6),
                        Text(coffee.rating.toString(), style: TextStyle(color: AppColors.greyText)),
                        Spacer(),
                        Text('\$${coffee.price.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.softGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, size: 16),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
