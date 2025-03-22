class UserInfo {
  final String id;
  final double lat;
  final double lng;
  final String phone;
  final String whatsapp;
  final String facebook;
  final String instagram;
  final String address;
  final String description;
  final int status;

  UserInfo({
    required this.id,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.whatsapp,
    required this.facebook,
    required this.instagram,
    required this.address,
    required this.description,
    required this.status,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['_id'],
      lat: json['location']['lat'],
      lng: json['location']['lng'],
      phone: json['phone'],
      whatsapp: json['whatsapp'],
      facebook: json['facebook'] ?? '',
      instagram: json['instagram'] ?? '',
      address: json['address'],
      description: json['description'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'location': {
        'lat': lat,
        'lng': lng,
      },
      'phone': phone,
      'whatsapp': whatsapp,
      'facebook': facebook,
      'instagram': instagram,
      'address': address,
      'description': description,
      'status': status,
    };
  }
}
