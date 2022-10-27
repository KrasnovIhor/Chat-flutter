import 'package:chat_flutter/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.sender,
    required this.text,
    this.isIncoming = false,
  });

  final String sender;
  final String text;
  final bool isIncoming;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isIncoming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius:
                isIncoming ? kIncomingBorderRadius : kOutgoingBorderRadius,
            color: isIncoming ? Colors.white : Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isIncoming ? Colors.black54 : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
