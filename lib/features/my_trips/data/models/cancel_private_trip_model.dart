class CancelPrivateTripModel {
  String? message;
  int? thePrice;
  int? theReturnPrice;

  CancelPrivateTripModel({
    this.message,
    this.thePrice,
    this.theReturnPrice,
  });

  factory CancelPrivateTripModel.fromJson(Map<String, dynamic> json) {
    return CancelPrivateTripModel(
      message: json['message'] as String?,
      thePrice: json['thePrice'] as int?,
      theReturnPrice: json['theReturnPrice'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'thePrice': thePrice,
        'theReturnPrice': theReturnPrice,
      };
}
