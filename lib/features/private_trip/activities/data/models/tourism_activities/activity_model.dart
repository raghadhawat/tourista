class ActivityModel {
  int? id;
  List<dynamic>? images;
  String? name;
  String? description;
  String? openingHours;
  String? recommendedTime;
  String? type;
  int? cityId;

  ActivityModel({
    this.id,
    this.images,
    this.name,
    this.description,
    this.openingHours,
    this.recommendedTime,
    this.type,
    this.cityId,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        id: json['id'] as int?,
        images: json['images'] as List<dynamic>?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        openingHours: json['openingHours'] as String?,
        recommendedTime: json['recommendedTime'] as String?,
        type: json['type'] as String?,
        cityId: json['city_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'images': images,
        'name': name,
        'description': description,
        'openingHours': openingHours,
        'recommendedTime': recommendedTime,
        'type': type,
        'city_id': cityId,
      };
}
