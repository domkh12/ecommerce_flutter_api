class Tag {
  final int id;
  final String name;
  final double price;

  Tag({required this.id, required this.name, required this.price});

  factory Tag.fromJson(Map<String, dynamic> data) => Tag(
        id: data['id'],
        name: data['attributes']['name'],
        price: data['attributes']['price'].toDouble(),
      );
}
