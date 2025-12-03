class CoffeeModel {
  final String id;
  final String title;
  final String subtitle;
  final String image; // asset path
  final double price;
  final double rating;

  CoffeeModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.rating,
  });
}
