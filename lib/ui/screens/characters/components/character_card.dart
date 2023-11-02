import 'package:flutter/material.dart';
import 'package:thrones_app/domain/entities/character_entity.dart';
import 'package:thrones_app/ui/screens/character_details/character_details.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => CharacterDetails(character: character)));
        },
        child: Card(
          color: Theme.of(context).primaryColor,
          child: ListTile(
            title: Text(
              character.fullName,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '${character.family}',
              style: const TextStyle(color: Colors.white),
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(character.imageUrl.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
