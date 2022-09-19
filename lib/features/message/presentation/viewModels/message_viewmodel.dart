import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc_flutter_riverpod/features/message/data/repositories/message_repository.dart';
import 'package:poc_flutter_riverpod/features/message/data/irepositories/message_repository.dart';

import '../../domain/models/message.dart';

final messageViewModelProvider =
    StateNotifierProvider<MessageStateNotifier, MessageState>((ref) =>
        MessageStateNotifier(
            messageRepository: ref.watch(messageRepositoryProvider)));

enum MessageStatus { loading, success, error }

// MessageViewModel
class MessageState {
  List<Message> messages;
  String username;

  MessageState({
    this.messages = const [],
    this.username = "Anonymous",
  });

  MessageState copyWith({
    List<Message>? messages,
    String? username,
  }) {
    return MessageState(
      messages: messages ?? this.messages,
      username: username ?? this.username,
    );
  }
}

// MessageNotifier
class MessageStateNotifier extends StateNotifier<MessageState> {
  MessageStateNotifier({required this.messageRepository})
      : super(MessageState()) {
    getMessages();
  }

  IMessageRepository messageRepository;

  Future<void> getMessages() async =>
      state = state.copyWith(messages: await messageRepository.getMessages());

  Future<void> addItem(String item) async {
    item += " #${state.messages.length}";
    final Message message = Message(message: item, publishDate: DateTime.now());
    await messageRepository.createMessage(message);
    state = state.copyWith(messages: [...state.messages, message]);
  }

  Future<void> removeItem(Message item) async {
    await messageRepository.deleteMessage(item.id!);
    List<Message> newList = state.messages;
    newList.removeWhere((element) => element.id == item.id);
    state = state.copyWith(messages: newList);
  }
}
