import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_riverpod/features/message/data/repositories_impl/message_repository.dart';
import 'package:poc_flutter_riverpod/features/message/domain/models/message.dart';
import 'package:poc_flutter_riverpod/shared/api/iapi_repository.dart';

import '../../../../shared/api/api_repository.dart';

final messageRepositoryProvider = Provider<IMessageRepository>((ref) =>
    MessageRepository(apiRepository: ref.watch(apiRepositoryProvider)));

class MessageRepository extends IMessageRepository {
  final IApiRepository apiRepository;

  MessageRepository({required this.apiRepository});

  @override
  Future<List<Message>> getMessages() async {
    final messages =
        Future.delayed(const Duration(milliseconds: 300), () async {
      var items = await apiRepository.get('messages');
      return List<Message>.from(
          items.data.map((item) => Message.fromMap(item)));
    });
    return messages;
  }

  @override
  Future<Message> getMessage(String id) async {
    final message = Future.delayed(const Duration(milliseconds: 300), () async {
      var item = await apiRepository.get('messages/$id');
      return Message.fromMap(item.data);
    });
    return message;
  }

  @override
  Future<bool> createMessage(Message msg) async {
    final response = await apiRepository.post('messages', msg.toMap());
    return response.statusCode == 200 ? true : false;
  }

  @override
  Future<bool> updateMessage(Message msg) async {
    final response = await apiRepository.put('messages/${msg.id}', msg.toMap());
    return response.statusCode == 200 ? true : false;
  }

  @override
  Future<bool> deleteMessage(String id) async {
    final response = await apiRepository.delete('messages/$id');
    return response.statusCode == 200 ? true : false;
  }
}
