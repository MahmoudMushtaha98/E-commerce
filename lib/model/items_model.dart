class ItemsModel{
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final rate;
  final count;

  ItemsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
        required this.rate,
      required this.count}
      );
}