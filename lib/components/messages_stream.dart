import 'package:chat_flutter/components/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _db = FirebaseFirestore.instance;
late User loggedInUser;

class MessagesStream extends StatelessWidget {
  const MessagesStream({super.key, required this.currentUser});

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        final messages = snapshot.data?.docs.reversed;
        List<MessageBubble> messageBubbles = [];

        if (messages != null) {
          for (var message in messages) {
            final String messageText = message.data()['text'];
            final String messageSender = message.data()['sender'];

            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isIncoming: currentUser.email != messageSender,
            );

            messageBubbles.add(messageBubble);
          }
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 15.0,
            ),
            children: messageBubbles,
          ),
        );
      }),
      stream: _db.collection('messages').orderBy('createdAt').snapshots(),
    );
  }
}
