import 'package:flutter/material.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';

class ProfileAvatar extends StatelessWidget {
  final CharacterEntity character;
  final double radius;
  const ProfileAvatar({super.key, required this.character, required this.radius});

  @override
  Widget build(BuildContext context) {
    ImageProvider background = NetworkImage(character.imageUrl!);
    return CircleAvatar(
      backgroundImage: background,
      radius: radius,
    );
  }
}
