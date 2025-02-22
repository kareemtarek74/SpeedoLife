class Product {
  final String id;
  final String name;
  final String? image;
  final String description;
  final int finalPrice;
  final int balance;
  final int status;
  final String? offer;

  Product({
    required this.id,
    required this.name,
    this.image,
    this.offer,
    required this.description,
    required this.finalPrice,
    required this.balance,
    required this.status,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      description: json['description'] as String? ?? '',
      finalPrice: (json['finalPrice'] as int?) ?? 0,
      balance: (json['balance'] as int?) ?? 0,
      status: (json['status'] as int?) ?? 0,
      offer: json['offer'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'description': description,
      'finalPrice': finalPrice,
      'balance': balance,
      'status': status,
      'offer': offer,
    };
  }
}
