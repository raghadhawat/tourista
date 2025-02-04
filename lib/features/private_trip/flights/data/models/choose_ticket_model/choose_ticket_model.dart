import 'the_ticket_id.dart';

class ChooseTicketModel {
  String? message;
  TheTicketId? theTicketId;

  ChooseTicketModel({this.message, this.theTicketId});

  factory ChooseTicketModel.fromJson(Map<String, dynamic> json) {
    return ChooseTicketModel(
      message: json['message'] as String?,
      theTicketId: json['The Ticket_id :'] == null
          ? null
          : TheTicketId.fromJson(
              json['The Ticket_id :'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'The Ticket_id :': theTicketId?.toJson(),
      };
}
