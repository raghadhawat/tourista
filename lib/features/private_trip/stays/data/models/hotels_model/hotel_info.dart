class HotelInfo {
  int? id;
  String? name;
  int? rate;

  HotelInfo({this.id, this.name, this.rate});

  factory HotelInfo.fromJson(Map<String, dynamic> json) => HotelInfo(
        id: json['id'] as int?,
        name: json['name'] as String?,
        rate: json['rate'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rate': rate,
      };
}
