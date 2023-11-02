import 'package:flutter/material.dart';
import 'package:thrones_app/di/dependency_injection.dart';
import 'package:thrones_app/ui/design/theme.dart';
import 'package:thrones_app/ui/screens/characters/characters_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thrones app',
      theme: appTheme(),
      home: const ItemsScreen(),
    );
  }
}
