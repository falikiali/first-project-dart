class Kacamata {
  int id;
  String name;
  String description;
  int stock;
  int terjual;
  String price;
  double rating;
  String thumbnail;
  List<String> photos;

  Kacamata({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.terjual,
    required this.rating,
    required this.thumbnail,
    required this.photos
  });
}