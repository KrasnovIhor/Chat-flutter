import 'package:chat_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  FlashChat({super.key});

  final GoRouter _router = createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flash Chat',
      routerConfig: _router,
    );
  }
}
