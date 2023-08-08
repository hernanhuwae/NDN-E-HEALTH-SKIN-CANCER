import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String pengirimId;
  final String pengirimMessage;
  final String penerimaId;
  final String messageNdn;
  final Timestamp timestampNdn;

  Message(
      {required this.pengirimId,
      required this.pengirimMessage,
      required this.penerimaId,
      required this.messageNdn,
      required this.timestampNdn});

  Map<String, dynamic> toMap() {
    return {
      'pengirimId': pengirimId,
      'pengirimMessage': pengirimMessage,
      'penerimaId': penerimaId,
      'messageNdn': messageNdn,
      'timestampNdn': timestampNdn,
    };
  }
}
