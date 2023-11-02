import 'package:flutter/material.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(character.fullName),
    );
  }
}
