class Review {
  double? cleanliness;
  double? comfort;
  int? facilities;

  Review({this.cleanliness, this.comfort, this.facilities});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        cleanliness: (json['cleanliness'] as num?)?.toDouble(),
        comfort: (json['comfort'] as num?)?.toDouble(),
        facilities: json['Facilities'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'cleanliness': cleanliness,
        'comfort': comfort,
        'Facilities': facilities,
      };
}
