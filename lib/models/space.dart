class Space {
  late int id;
  late String name;
  late String city;
  late String country;
  late String photo;
  late double price;
  late int rating;
  late String address;
  late String image;
  late String phone;
  late String mapUrl;
  late int kamarTersedia;
  late int jumlahKamar;
  late String wifi;

  Space({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.photo,
    required this.price,
    required this.rating,
    required this.address,
    required this.image,
    required this.phone,
    required this.mapUrl,
    required this.kamarTersedia,
    required this.jumlahKamar,
    required this.wifi,
  });

  // Metode factory untuk membuat instance Space dari Map<String, dynamic>
  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      country: json['country'],
      photo: json['photo'],
      price: double.parse(json['price']),
      address: json['address'],
      image: json['image'],
      phone: json['phone'],
      mapUrl: json['map_url'],
      rating: json['rating'] as int, // Sesuaikan dengan tipe data pada JSON
      kamarTersedia:
          json['kamar_tersedia'] as int, // Sesuaikan dengan tipe data pada JSON
      jumlahKamar: json['jumlah_kamar'] as int,
      wifi: json['wifi'],
    );
  }
}
