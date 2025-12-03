import 'package:coffee_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/order_controller.dart';
import '../../widgets/custom_button.dart';

class OrderView extends StatelessWidget {
  final oc = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        backgroundColor: AppColors.scaffold,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Obx(() {
          if (oc.items.isEmpty) {
            return Center(child: Text('Your cart is empty', style: TextStyle(color: AppColors.greyText)));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ChoiceChip(label: Text('Deliver'), selected: oc.isDeliver.value, onSelected: (v) => oc.isDeliver.value = true),
                  SizedBox(width: 10),
                  ChoiceChip(label: Text('Pick Up'), selected: !oc.isDeliver.value, onSelected: (v) => oc.isDeliver.value = false),
                ],
              ),
              SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: oc.items.length,
                  separatorBuilder: (_, __) => Divider(),
                  itemBuilder: (ctx, idx) {
                    final it = oc.items[idx];
                    return ListTile(
                      leading: Image.asset(it.coffee.image, width: 56, height: 56),
                      title: Text(it.coffee.title),
                      subtitle: Text('${it.qty} x ${it.size}'),
                      trailing: Text('\$${(it.coffee.price * it.qty).toStringAsFixed(2)}'),
                    );
                  },
                ),
              ),
              Divider(),
              ListTile(
                title: Text('Price'),
                trailing: Text('\$${oc.subtotal.toStringAsFixed(2)}'),
              ),
              ListTile(
                title: Text('Delivery Fee'),
                trailing: Text('\$${oc.deliveryFee.toStringAsFixed(2)}'),
              ),
              ListTile(
                title: Text('Total', style: TextStyle(fontWeight: FontWeight.w700)),
                trailing: Text('\$${oc.total.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.w700)),
              ),
              CustomButton(
                text: 'Order',
                onPressed: () {
                  Get.snackbar('Order placed', 'Your order is on the way', snackPosition: SnackPosition.BOTTOM);
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
