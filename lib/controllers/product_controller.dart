import 'package:get/get.dart';
import '../models/coffee_model.dart';

class ProductController extends GetxController {
  final coffee = Rxn<CoffeeModel>();
  final quantity = 1.obs;
  final size = 'M'.obs; // S, M, L

  void setCoffee(CoffeeModel c) {
    coffee.value = c;
  }

  void increment() => quantity.value++;
  void decrement() {
    if (quantity.value > 1) quantity.value--;
  }

  double get total {
    final p = coffee.value?.price ?? 0.0;
    return p * quantity.value;
  }
}
