import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/other_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/4128/4128176.png'),
          ),
        ),
        title: const Text('Test user', 
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0)
          )
        ),
      ),
      body: _ChatView()
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                 final message = chatProvider.messageList[index];
                 return message.fromWho == FromWho.me
                 ? MyMessageBubble( mesagge: message )
                 : OtherMessageBubble();
              }),
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage
            ),
          ],
        ),
      ),
    );
  }
}