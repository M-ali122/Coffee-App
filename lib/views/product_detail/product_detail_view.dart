import 'package:coffee_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import '../../controllers/order_controller.dart';
import '../../widgets/quantity_selector.dart';
import '../../widgets/custom_button.dart';

class ProductDetailView extends StatelessWidget {
  final pc = Get.find<ProductController>();
  final oc = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    final coffee = pc.coffee.value!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffold,
        elevation: 0,
        leading: BackButton(color: AppColors.dark),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border, color: AppColors.dark)),
        ],
      ),
      backgroundColor: AppColors.scaffold,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Hero(
              tag: coffee.id,
              child: Container(
                height: 190,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(coffee.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Hero(
            //   tag: coffee.id,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(16),
            //     child: Image.asset(
            //       coffee.image,
            //       height: 220,
            //       width: double.infinity,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),

            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(coffee.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 6),
                Text('${coffee.rating} (${(coffee.rating * 50).toInt()})',
                    style: TextStyle(color: AppColors.greyText)),
                Spacer(),
                Text('\$${coffee.price.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary)),
              ],
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 6),
            Text(
              'A cappuccino is an approximately 150 ml beverage, with 25 ml of espresso coffee and 85ml of fresh milk froth. Enjoy the rich aroma and creamy texture.',
              style: TextStyle(color: AppColors.greyText),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                ChoiceChip(
                    label: Text('S'),
                    selected: pc.size.value == 'S',
                    onSelected: (v) => pc.size.value = 'S'),
                SizedBox(width: 8),
                ChoiceChip(
                    label: Text('M'),
                    selected: pc.size.value == 'M',
                    onSelected: (v) => pc.size.value = 'M'),
                SizedBox(width: 8),
                ChoiceChip(
                    label: Text('L'),
                    selected: pc.size.value == 'L',
                    onSelected: (v) => pc.size.value = 'L'),
                Spacer(),
                QuantitySelector(
                  quantity: pc.quantity,
                  onIncrement: pc.increment,
                  onDecrement: pc.decrement,
                )
              ],
            ),
            Spacer(),
            CustomButton(
              text: 'Buy Now',
              onPressed: () {
                oc.addToCart(coffee,
                    qty: pc.quantity.value, size: pc.size.value);
                Get.snackbar('Added', '${coffee.title} added to cart',
                    snackPosition: SnackPosition.BOTTOM);
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
