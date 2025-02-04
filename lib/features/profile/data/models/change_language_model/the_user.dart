class TheUser {
  int? id;
  String? name;
  String? language;
  int? points;
  int? wallet;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  TheUser({
    this.id,
    this.name,
    this.language,
    this.points,
    this.wallet,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory TheUser.fromJson(Map<String, dynamic> json) => TheUser(
        id: json['id'] as int?,
        name: json['name'] as String?,
        language: json['language'] as String?,
        points: json['points'] as int?,
        wallet: json['wallet'] as int?,
        type: json['type'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'language': language,
        'points': points,
        'wallet': wallet,
        'type': type,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
