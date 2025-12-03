import 'package:get/get.dart';
import '../models/coffee_model.dart';

class HomeController extends GetxController {
  final coffees = <CoffeeModel>[].obs;
  final selectedCategory = 'Cappuccino'.obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() {
    coffees.assignAll([
      CoffeeModel(
        id: 'c1',
        title: 'Cappuccino',
        subtitle: 'with Chocolate',
        image: 'assets/images/cappuccino.png',
        price: 4.53,
        rating: 4.8,
      ),
      CoffeeModel(
        id: 'c2',
        title: 'Latte',
        subtitle: 'with Milk',
        image: 'assets/images/latte.png',
        price: 3.99,
        rating: 4.6,
      ),
      CoffeeModel(
        id: 'c3',
        title: 'Macchiato',
        subtitle: 'Espresso',
        image: 'assets/images/macchiato.png',
        price: 4.25,
        rating: 4.7,
      ),
      CoffeeModel(
        id: 'c4',
        title: 'Americano',
        subtitle: 'Dark Roast',
        image: 'assets/images/americano.png',
        price: 3.25,
        rating: 4.4,
      ),
    ]);
  }

  void changeCategory(String cat) {
    selectedCategory.value = cat;
    // optionally filter coffees
  }
}
