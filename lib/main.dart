import 'package:chat_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  FlashChat({super.key});

  final GoRouter _router = createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flash Chat',
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      routerConfig: _router,
    );
  }
}
