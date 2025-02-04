import 'room.dart';

class RoomHotelModel {
  int? numOfRoom;
  List<Room>? room;

  RoomHotelModel({this.numOfRoom, this.room});

  factory RoomHotelModel.fromJson(Map<String, dynamic> json) {
    return RoomHotelModel(
      numOfRoom: json['numOfRoom'] as int?,
      room: (json['room'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'numOfRoom': numOfRoom,
        'room': room?.map((e) => e.toJson()).toList(),
      };
}
