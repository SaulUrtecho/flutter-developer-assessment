import 'package:flutter/material.dart';

class WelcomingScreen extends StatefulWidget {
  const WelcomingScreen({super.key});

  @override
  State<WelcomingScreen> createState() => _WelcomingScreenState();
}

class _WelcomingScreenState extends State<WelcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Thrones app')),
      body: ListView.builder(itemBuilder: (_, index) {
        return Container();
      }),
    );
  }
}
