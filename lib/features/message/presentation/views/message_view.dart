import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewModels/message_viewmodel.dart';
import '../styles.dart';

// HomePage (utilisant le MessageViewModel)
class MessageView extends ConsumerWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Définition du MessageViewModel
    final MessageState messageState = ref.watch(messageViewModelProvider);

    // Ecouté des changements d'état du MessageViewModel
    // ref.listen(
    //   messageNotifier,
    //   (previous, next) {
    //   if(next.messages.length >= 5){
    //     showDialog(
    //       context: context,
    //       builder: (context){
    //         return AlertDialog(
    //           title: const Text("Attention"),
    //           content: const Text("Vous avez plus de 5 messages"),
    //           actions: [
    //             TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Valider'))
    //           ],
    //         );
    //       });
    //   }
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text("Bonjour ${messageState.username},"),
        backgroundColor: darkGreen,
        actions: [
          IconButton(
              onPressed: () {
                // Reset le MessageViewModel
                ref.refresh(messageViewModelProvider);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          return messageState.messages.isEmpty
              ? const Text("Aucun Messages",
                  style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic))
              : ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text("$index"),
                      title: Text(messageState.messages[index].message),
                      subtitle: Text(
                          messageState.messages[index].publishDate.toString()),
                      trailing: ElevatedButton(
                          onPressed: () {
                            ref
                                .read(messageViewModelProvider.notifier)
                                .removeItem(messageState.messages[index]);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkGreen,
                          ),
                          child: const Text("Supprimer")),
                    );
                  },
                  itemCount: messageState.messages.length,
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          ref
              .read(messageViewModelProvider.notifier)
              .addItem("Nouveau Message");
        }),
        backgroundColor: darkGreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
