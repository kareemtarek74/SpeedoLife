class Offer {
  final String id;
  final String name;
  final String image;
  final String description;
  final int discount;
  final int discountPercentage;
  final int status;
  final int sort;

  Offer({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.discount,
    required this.discountPercentage,
    required this.status,
    required this.sort,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      description: json['description'] ?? '',
      discount: json['discount'] ?? 0,
      discountPercentage: json['discountPercentage'] ?? 0,
      status: json['status'] ?? 0,
      sort: json['sort'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'description': description,
      'discount': discount,
      'discountPercentage': discountPercentage,
      'status': status,
      'sort': sort,
    };
  }
}
