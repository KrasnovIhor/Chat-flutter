import 'package:flutter/material.dart';
import 'package:chat_flutter/screens/welcome_screen.dart';

void main() => runApp(const FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
