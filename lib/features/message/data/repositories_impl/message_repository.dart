import '../../domain/models/message.dart';

abstract class IMessageRepository {
  Future<List<Message>> getMessages();
  Future<Message> getMessage(String id);
  Future<bool> createMessage(Message msg);
  Future<bool> updateMessage(Message msg);
  Future<bool> deleteMessage(String id);
}
