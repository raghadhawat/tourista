class Hotel {
  int? id;
  String? name;
  int? rate;

  Hotel({this.id, this.name, this.rate});

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
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
