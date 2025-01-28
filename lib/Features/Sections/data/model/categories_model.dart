class Category {
  final String id;
  final String name;
  final String image;
  final int status;
  final int sort;
  final int count;
  final int discount;
  final int discountPercentage;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.sort,
    required this.count,
    required this.discount,
    required this.discountPercentage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      sort: json['sort'],
      count: json['count'],
      discount: json['discount'],
      discountPercentage: json['discountPercentage'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'status': status,
      'sort': sort,
      'count': count,
      'discount': discount,
      'discountPercentage': discountPercentage,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
