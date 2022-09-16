// MessageModel

import 'package:poc_flutter_riverpod/features/message/domain/models/message.dart';

class Message {
  String? id;
  String message;
  DateTime publishDate;
  int? authorId;

  Message({
    this.id,
    required this.message,
    required this.publishDate,
    this.authorId,
  });

  Message.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        message = data['message'],
        publishDate = DateTime.parse(data['publishDate']),
        authorId = data['authorId'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'publishDate': publishDate.toIso8601String(),
      'authorId': authorId
    };
  }

  Message copyWith({
    String? id,
    String? message,
    DateTime? publishDate,
    int? authorId,
  }) {
    return Message(
      id: id ?? this.id,
      message: message ?? this.message,
      publishDate: publishDate ?? this.publishDate,
      authorId: authorId ?? this.authorId,
    );
  }
}
