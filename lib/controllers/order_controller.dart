import 'package:get/get.dart';
import '../models/coffee_model.dart';

class OrderItem {
  final CoffeeModel coffee;
  int qty;
  String size;
  OrderItem({required this.coffee, this.qty = 1, this.size = 'M'});
}

class OrderController extends GetxController {
  final items = <OrderItem>[].obs;
  final isDeliver = true.obs;

  void addToCart(CoffeeModel coffee, {int qty = 1, String size = 'M'}) {
    final existing = items.firstWhereOrNull((e) => e.coffee.id == coffee.id && e.size == size);
    if (existing != null) {
      existing.qty += qty;
      items.refresh();
    } else {
      items.add(OrderItem(coffee: coffee, qty: qty, size: size));
    }
  }

  void removeItem(OrderItem it) {
    items.remove(it);
  }

  double get subtotal => items.fold(0.0, (s, e) => s + e.coffee.price * e.qty);
  double get deliveryFee => items.isEmpty ? 0.0 : 2.0;
  double get total => subtotal + deliveryFee;
}
