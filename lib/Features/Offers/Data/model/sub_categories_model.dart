class SubCategoriesModel {
  final String id;
  final String name;
  final String image;
  final int status;
  final int sort;
  final int count;
  final int discount;
  final int discountPercentage;

  SubCategoriesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.sort,
    required this.count,
    required this.discount,
    required this.discountPercentage,
  });

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesModel(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      status: json['status'] ?? 0,
      sort: json['sort'] ?? 0,
      count: json['count'] ?? 0,
      discount: json['discount'] ?? 0,
      discountPercentage: json['discountPercentage'] ?? 0,
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
    };
  }
}
